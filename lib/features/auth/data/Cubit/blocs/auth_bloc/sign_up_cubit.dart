import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/auth/data/Cubit/models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_states.dart';

class RegisterCubit extends Cubit<SignUpStates> {
  RegisterCubit(this.api) : super(SignUpLoading());
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final ApiConsumer api;
  SignUpModel? user;
  Future<void> signUp() async {
    if (!(signUpFormKey.currentState?.validate() ?? false)) {
      return;
    }

    try {
      emit(SignUpLoading());

      final response = await api.post(EndPoint.signUp, data: {
        ApiKey.email: signUpEmail.text,
        ApiKey.password: signUpPassword.text,
        ApiKey.confirmPassword: confirmPassword.text,
        ApiKey.username: signUpName.text,
        "userType": "Vendor",
      });

      if (response is Map<String, dynamic> && response.containsKey("status")) {
        user = SignUpModel.fromJson(response);
        if (user!.statusCode) {
          final userId = user!.userId;
          debugPrint("User ID: $userId");

          emit(SignUpSucess());
          return;
        }
      } else {
        emit(SignUpFalier(errorMassage: "Unexpected response"));
      }
    } on ServerException catch (e) {
      emit(SignUpFalier(errorMassage: e.errModel.errMessage));
    } on DioException catch (e) {
      emit(SignUpFalier(
          errorMassage: e.response?.data["message"] ?? "UnKnown error"));
    } catch (e) {
      emit(SignUpFalier(errorMassage: " Un expected error : $e"));
    }
  }
}
