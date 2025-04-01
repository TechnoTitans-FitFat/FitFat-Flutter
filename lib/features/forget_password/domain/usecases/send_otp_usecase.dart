import 'package:fitfat/features/forget_password/domain/usecases/reset_password_usecase.dart';

class SendOtpUseCase {
  final ForgotPasswordRepository _repository;

  SendOtpUseCase(this._repository);

  Future<Map<String, dynamic>> call(String email) async {
    // Add any use-case specific validation
    if (!_isValidEmail(email)) {
      throw 'Invalid email address';
    }
    return await _repository.sendPasswordResetOtp(email);
  }

  bool _isValidEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }
}
