import 'package:equatable/equatable.dart';

enum ForgotPasswordStatus {
  initial,
  loading,
  otpSent,
  otpVerified,
  resetSuccess,
  error
}

class ForgotPasswordState extends Equatable {
  final ForgotPasswordStatus status;
  final String? email;
  final String? resetToken;
  final String? errorMessage;

  const ForgotPasswordState({
    this.status = ForgotPasswordStatus.initial,
    this.email,
    this.resetToken,
    this.errorMessage,
  });

  ForgotPasswordState copyWith({
    ForgotPasswordStatus? status,
    String? email,
    String? resetToken,
    String? errorMessage,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
      email: email ?? this.email,
      resetToken: resetToken ?? this.resetToken,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, email, resetToken, errorMessage];
}
