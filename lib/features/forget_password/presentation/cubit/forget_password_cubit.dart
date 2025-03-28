import 'package:fitfat/features/forget_password/domain/repositories/forget_password_repository.dart';
import 'package:fitfat/features/forget_password/presentation/cubit/forget_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/send_otp_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final SendOtpUseCase _sendOtpUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  ForgotPasswordCubit({
    required SendOtpUseCase sendOtpUseCase,
    required VerifyOtpUseCase verifyOtpUseCase,
    required ResetPasswordUseCase resetPasswordUseCase,
  })  : _sendOtpUseCase = sendOtpUseCase,
        _verifyOtpUseCase = verifyOtpUseCase,
        _resetPasswordUseCase = resetPasswordUseCase,
        super(const ForgotPasswordState());

  Future<void> sendPasswordResetOtp(String email) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));
    try {
      final response = await _sendOtpUseCase(email);
      if (response['status'] == true) {
        emit(state.copyWith(
          status: ForgotPasswordStatus.otpSent,
          email: email,
        ));
      } else {
        emit(state.copyWith(
          status: ForgotPasswordStatus.error,
          errorMessage: response['message'] ?? 'Failed to send OTP',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: ForgotPasswordStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> verifyOtp(String otp) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));
    try {
      final response = await _verifyOtpUseCase(state.email!, otp);
      if (response.containsKey('resetToken')) {
        emit(state.copyWith(
          status: ForgotPasswordStatus.otpVerified,
          resetToken: response['resetToken'],
        ));
      } else {
        emit(state.copyWith(
          status: ForgotPasswordStatus.error,
          errorMessage: 'Invalid OTP',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: ForgotPasswordStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> resetPassword(String newPassword, String confirmPassword) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));
    try {
      final response = await _resetPasswordUseCase(
          newPassword, confirmPassword, state.resetToken!);

      if (response['status'] == true) {
        emit(state.copyWith(
          status: ForgotPasswordStatus.resetSuccess,
        ));
      } else {
        emit(state.copyWith(
          status: ForgotPasswordStatus.error,
          errorMessage: response['message'] ?? 'Failed to reset password',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: ForgotPasswordStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void resetState() {
    emit(const ForgotPasswordState());
  }
}
