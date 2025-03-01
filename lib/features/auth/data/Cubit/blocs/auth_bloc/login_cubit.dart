import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/api_services.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/cache/cache_helper.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/auth/data/Cubit/models/sign_in_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.api) : super(LoginLoading());
  final ApiConsumer api;
  final apiService = ApiServices(Dio());
  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  SignInModel? user;

  // signIn() async {
  //   try {
  //     Print.info('loading');
  //     emit(LoginLoading());
  //
  //     final response = await apiService.postRequest(
  //       endpoint: EndPoint.signIn,
  //       data: {
  //         ApiKey.email: signInEmail.text,
  //         ApiKey.password: signInPassword.text
  //       },
  //     );
  //
  //     Print.info('send request');
  //
  //     if (response.statusCode == 200) {
  //       Print.warning(response.data.toString());
  //       user = SignInModel.fromJson(response.data);
  //
  //       final decodedToken = JwtDecoder.decode(user!.token);
  //
  //       if (decodedToken.containsKey(ApiKey.id)) {
  //         await CacheHelper().saveData(key: ApiKey.token, value: user!.token);
  //         await CacheHelper()
  //             .saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
  //         emit(LoginSucess());
  //       } else {
  //         emit(LoginFalier(errorMassage: "Invalid token"));
  //       }
  //     } else {
  //       emit(LoginFalier(
  //           errorMassage: "Unexpected response: ${response.statusCode}"));
  //     }
  //     Print.info('done');
  //   } on DioException catch (e) {
  //     Print.error("Dio error: ${e.message}");
  //     emit(LoginFalier(errorMassage: "Network error: ${e.message}"));
  //   } catch (e) {
  //     Print.error("Error: ${e.toString()}");
  //     emit(LoginFalier(errorMassage: "Unexpected error occurred"));
  //   }
  // }

  // signIn() async {
  //   try {
  //     emit(LoginLoading());
  //     final response = await api.post(EndPoint.signIn, data: {
  //       ApiKey.email: signInEmail.text,
  //       ApiKey.password: signInPassword.text
  //     });
  //     user = SignInModel.fromJson(response);
  //     final decodedToken = JwtDecoder.decode(user!.token);
  //     if (decodedToken.containsKey(ApiKey.id)) {
  //       CacheHelper().saveData(key: ApiKey.token, value: user!.token);
  //       CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
  //     } else {
  //       emit(LoginFalier(errorMassage: "Invalid token"));
  //     }
  //     print(response.data.toString());
  //     print("Received Token: ${user!.token}");
  //     emit(LoginSucess());
  //   } on ServerException catch (e) {
  //     emit(LoginFalier(errorMassage: e.errModel.errMessage));
  //   } on DioException catch (e) {
  //     print("Dio error: ${e.message}");
  //     print("Response data: ${e.response?.data}");
  //     print("Response status code: ${e.response?.statusCode}");
  //     handleDioException(e);
  //   } catch (e) {
  //     emit(LoginFalier(errorMassage: "An unexpected error occurred"));
  //   }
  // }

  signIn() async {
    try {
      emit(LoginLoading());
      final response = await api.post(EndPoint.signIn, data: {
        ApiKey.email: signInEmail.text,
        ApiKey.password: signInPassword.text
      });

      user = SignInModel.fromJson(response);
      print("Received Token: ${user?.token}");

      if (user?.token == null || user!.token.isEmpty) {
        emit(LoginFalier(errorMassage: "Invalid token received"));
        return;
      }

      try {
        final decodedToken = JwtDecoder.decode(user!.token);
        print("Decoded Token: $decodedToken");

        if (!decodedToken.containsKey(ApiKey.id)) {
          emit(LoginSucess());
          return;
        }

        await CacheHelper().saveData(key: ApiKey.token, value: user!.token);
        await CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);

        print("Login successful, emitting success state...");
        emit(LoginSucess());
      } catch (e) {
        emit(LoginFalier(errorMassage: "Error decoding token ${e.toString()}"));
      }
      print(response.toString());
    } on ServerException catch (e) {
      emit(LoginFalier(errorMassage: e.errModel.errMessage));
    } on DioException catch (e) {
      print("Response data: ${e.response?.data}");
      print("Response status code: ${e.response?.statusCode}");
      emit(LoginFalier(errorMassage: "Dio error: ${e.message}"));
    } catch (e) {
      emit(LoginFalier(errorMassage: "An unexpected error occurred ${e.toString()}"));
    }
  }
}
