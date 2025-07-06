import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/api_services.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_state.dart';
import 'package:fitfat/features/auth/data/Cubit/models/sign_in_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

      debugPrint("Login response: $response");
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

        // Save token, user ID, and isLoggedIn in SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', user!.token);
        await prefs.setString('id', decodedToken['id']);
        await prefs.setBool('isLoggedIn', true);
        debugPrint(
            "SharedPreferences: token=${user!.token}, id=${decodedToken['id']}, isLoggedIn=true");

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

  // Logout method to clear login state
  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove('id');
      await prefs.remove('isLoggedIn');
      debugPrint("SharedPreferences: Cleared token, id, and isLoggedIn");
      signInEmail.clear();
      signInPassword.clear();
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
