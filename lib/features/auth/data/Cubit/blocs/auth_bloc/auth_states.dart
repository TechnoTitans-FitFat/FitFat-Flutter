part of 'auth_bloc.dart';

abstract class authState {}

class LoginLoading extends authState {}

class LoginSucess extends authState {}

class LoginFalier extends authState {
  String errorMassage;

  LoginFalier({required this.errorMassage});
}

class AuthInitial extends authState {}

class RegisterLoading extends authState {}

class RegisterSucess extends authState {}

class RegisterFalier extends authState {
  String errorMassage;

  RegisterFalier({required this.errorMassage});
}
