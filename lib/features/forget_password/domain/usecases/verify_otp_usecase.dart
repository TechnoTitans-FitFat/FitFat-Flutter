import 'package:fitfat/features/forget_password/domain/usecases/reset_password_usecase.dart';

class VerifyOtpUseCase {
  final ForgotPasswordRepository _repository;

  VerifyOtpUseCase(this._repository);

  Future<Map<String, dynamic>> call(String email, String otp) async {
    // Add any use-case specific validation
    if (otp.length != 6) {
      throw 'OTP must be 6 digits';
    }
    return await _repository.verifyResetOtp(email, otp);
  }
}
