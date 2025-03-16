import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/auth/data/Cubit/models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'sign_up_states.dart';

class RegisterCubit extends Cubit<SignUpStates> {
  RegisterCubit(this.api) : super(SignUpInitial());

  final ApiConsumer api;

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController signUpName = TextEditingController();
  final TextEditingController signUpEmail = TextEditingController();
  final TextEditingController signUpPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  SignUpModel? user;

  Future<void> signUp(BuildContext context) async {
    if (!(signUpFormKey.currentState?.validate() ?? false)) {
      return;
    }

    try {
      emit(SignUpLoading());

      final requestData = {
        "username": signUpName.text,
        "email": signUpEmail.text,
        "password": signUpPassword.text,
        "confirmPassword": confirmPassword.text,
      };

      print("Sign-Up Request Data: $requestData");

      final response = await api.post(EndPoint.signUp, data: requestData);

      print("Sign-Up Response: $response");

      if (response is Map<String, dynamic>) {
        final bool status = response["status"] == true;
        final String message = response["message"] ?? "No message";
        final String userId = response["userId"] ?? "";

        if (status) {
          emit(SignUpSucess(email: signUpEmail.text,userId: userId));

          // Navigate to OTP screen with email and userId
          Get.toNamed(
            "/otpScreen",
            arguments: {
              "email": signUpEmail.text,
              "userId": userId,
            },
          );
          return;
        } else {
          emit(SignUpFalier(errorMassage:  message));
          return;
        }
      }

      emit(SignUpFalier(errorMassage: "Unexpected response format"));
    } on ServerException catch (e) {
      emit(SignUpFalier(errorMassage: e.errModel.errMessage));
    } on DioException catch (e) {
      final errorMessage = e.response?.data?["message"] ?? "Server error";
      emit(SignUpFalier(errorMassage: errorMessage));
    } catch (e) {
      emit(SignUpFalier(errorMassage: "Unexpected error: $e"));
    }
  }

  Future<void> verifyEmail(String email, String otp, String userId) async {
    try {
      emit(VerifyEmailLoading());

      // Validate inputs
      if (email.isEmpty || otp.isEmpty || userId.isEmpty) {
        emit(VerifyEmailFailure(errorMessage: "Email, OTP, or User ID is missing"));
        return;
      }

      if (otp.length != 6) {
        emit(VerifyEmailFailure(errorMessage: "OTP must be 6 digits"));
        return;
      }

      final requestData = {
        "email": email,
        "otp": otp,
      };

      print("Verify Email Request Data: $requestData");

      final response = await api.post(EndPoint.verifyEmail, data: requestData);

      print("Verify Email Response: $response");

      if (response is Map<String, dynamic>) {
        final bool status = response["status"] == true;
        final String message = response["message"] ?? "No message";

        if (status) {
          emit(VerifyEmailSuccess(sucessMessage:'Verified Successfully'));
          return ;
        } else {
          emit(VerifyEmailFailure(errorMessage: message));
          return;
        }
      }

      emit(VerifyEmailFailure(errorMessage: "Invalid response format"));
    } on ServerException catch (e) {
      emit(VerifyEmailFailure(errorMessage: e.errModel.errMessage));
    } on DioException catch (e) {
      final errorMessage = e.response?.data?["message"] ?? "Network error";
      emit(VerifyEmailFailure(errorMessage: errorMessage));
    } catch (e) {
      emit(VerifyEmailFailure(errorMessage: "Unexpected error: $e"));
    }
  }

  // Clean up resources when no longer needed
  @override
  Future<void> close() {
    signUpName.dispose();
    signUpEmail.dispose();
    signUpPassword.dispose();
    confirmPassword.dispose();
    return super.close();
  }
}