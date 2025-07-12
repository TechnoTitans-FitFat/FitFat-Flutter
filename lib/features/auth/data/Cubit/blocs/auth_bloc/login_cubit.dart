import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/api_services.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/core/utils/auth_utils.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_state.dart';
import 'package:fitfat/features/auth/data/Cubit/models/sign_in_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.api) : super(LoginInitial());

  final ApiConsumer api;
  final apiService = ApiServices(Dio());
  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  SignInModel? user;

  Future<void> signIn() async {
    try {
      emit(LoginLoading());
      final response = await api.post(EndPoint.signIn, data: {
        ApiKey.email: signInEmail.text,
        ApiKey.password: signInPassword.text
      });
      user = SignInModel.fromJson(response);
      if (user?.token == null || user!.token.isEmpty) {
        emit(LoginFailure(errorMessage: "Invalid token received"));
        return;
      }

      try {
        final decodedToken = JwtDecoder.decode(user!.token);
        debugPrint("Decoded Token: $decodedToken");

        if (!decodedToken.containsKey('id')) {
          emit(LoginFailure(errorMessage: "Invalid token: User ID missing"));
          return;
        }

        // Save authentication data using AuthUtils
        final success = await AuthUtils.saveAuthData(
          token: user!.token,
          userId: decodedToken['id'],
          email: user!.email,
          name: user!.name,
        );

        if (!success) {
          emit(
              LoginFailure(errorMessage: "Failed to save authentication data"));
          return;
        }

        debugPrint(
            "AuthUtils: token=${user!.token}, id=${decodedToken['id']}, isLoggedIn=true");

        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure(
            errorMessage: "Error decoding token: ${e.toString()}"));
      }
    } on ServerException catch (e) {
      emit(LoginFailure(errorMessage: e.errModel.errMessage));
    } on DioException catch (e) {
      emit(LoginFailure(errorMessage: "Dio error: ${e.message}"));
    } catch (e) {
      emit(LoginFailure(errorMessage: "Unexpected error: ${e.toString()}"));
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      final isAuthenticated = await AuthUtils.isAuthenticated();

      if (isAuthenticated) {
        // Get stored data from SharedPreferences
        final token = await AuthUtils.getToken();
        final userId = await AuthUtils.getUserId();
        final email = await AuthUtils.getUserEmail();
        final name = await AuthUtils.getUserName();

        if (token != null && userId != null) {
          user = SignInModel(
            token: token,
            id: userId,
            name: name ?? '',
            email: email ?? '',
          );
          return true;
        }
      }

      // Clear invalid data
      await logout();
      return false;
    } catch (e) {
      debugPrint("Error checking login status: $e");
      return false;
    }
  }

  // Logout method to clear login state
  Future<void> logout() async {
    try {
      await AuthUtils.clearAuthData();
      signInEmail.clear();
      signInPassword.clear();
      user = null;
      emit(LoginInitial());
    } catch (e) {
      emit(LoginFailure(errorMessage: "Logout failed: ${e.toString()}"));
    }
  }

  @override
  Future<void> close() {
    signInEmail.dispose();
    signInPassword.dispose();
    return super.close();
  }
}
