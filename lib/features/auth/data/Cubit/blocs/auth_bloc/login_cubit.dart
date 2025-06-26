import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/api_services.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/cache/cache_helper.dart';
import 'package:fitfat/core/errors/exceptions.dart';
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

  signIn() async {
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
        if (!decodedToken.containsKey(ApiKey.id)) {
          emit(LoginSuccess());
          return;
        }

        await CacheHelper().saveData(key: ApiKey.token, value: user!.token);
        await CacheHelper()
            .saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
        emit(LoginSuccess());
      } catch (e) {
        emit(
            LoginFailure(errorMessage: "Error decoding token ${e.toString()}"));
      }
    } on ServerException catch (e) {
      emit(LoginFailure(errorMessage: e.errModel.errMessage));
    } on DioException catch (e) {
      emit(LoginFailure(errorMessage: "Dio error: ${e.message}"));
    } catch (e) {
      emit(LoginFailure(
          errorMessage: "An unexpected error occurred ${e.toString()}"));
    }
  }
}
