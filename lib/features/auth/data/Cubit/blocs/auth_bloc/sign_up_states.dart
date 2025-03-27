part of 'sign_up_cubit.dart';

abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpLoading extends SignUpStates {}

class SignUpSucess extends SignUpStates {
  final String email;
  final String userId;

  SignUpSucess({required this.userId, required this.email});
}

class SignUpFalier extends SignUpStates {
  String? errorMassage;
  SignUpFalier({this.errorMassage});
}

class VerifyEmailLoading extends SignUpStates {}

class VerifyEmailSuccess extends SignUpStates {
  final String sucessMessage;

  VerifyEmailSuccess({required this.sucessMessage});
}

class VerifyEmailFailure extends SignUpStates {
  final String errorMessage;
  VerifyEmailFailure({required this.errorMessage});
}

class ResendOtpLoading extends SignUpStates {}

class ResendOtpSuccess extends SignUpStates {
  final String successMessage;

  ResendOtpSuccess({required this.successMessage});
}

class ResendOtpFailure extends SignUpStates {
  final String errorMessage;

  ResendOtpFailure({required this.errorMessage});
}
