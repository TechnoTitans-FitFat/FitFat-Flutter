import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/auth/data/Cubit/models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_states.dart';
class RegisterCubit extends Cubit<SignUpStates>{
  RegisterCubit(this.api): super(SignUpLoading());
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final ApiConsumer api;
  SignUpModel? user;

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(EndPoint.signUp, data: {
        ApiKey.email: signUpEmail.text,
        ApiKey.password: signUpPassword.text,
        ApiKey.confirmPassword:confirmPassword.text,
        ApiKey.name:signUpName.text,
        "userType": "Vendor",
      });
      user = SignUpModel.fromJson(response);
      print(response.data.toString());
      emit(SignUpSucess());
    } on ServerException catch (e) {
      emit(SignUpFalier(errorMassage: e.errModel.errMessage));
    }on DioException catch (e) {
      print("Response data: ${e.response?.data}");
      print("Response status code: ${e.response?.statusCode}");
      handleDioException(e);
    } catch (e) {
      emit(SignUpFalier(errorMassage: "An unexpected error occurred"));
    }
  }
}