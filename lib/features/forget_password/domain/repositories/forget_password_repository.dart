import 'package:fitfat/features/forget_password/domain/usecases/reset_password_usecase.dart';

class ResetPasswordUseCase {
  final ForgotPasswordRepository _repository;

  ResetPasswordUseCase(this._repository);

  Future<Map<String, dynamic>> call(
      String newPassword, String confirmPassword, String resetToken) async {
    // Add password validation
    if (newPassword != confirmPassword) {
      throw 'Passwords do not match';
    }

    if (!_isValidPassword(newPassword)) {
      throw 'Invalid password format';
    }

    return await _repository.resetPassword(
        newPassword, confirmPassword, resetToken);
  }

  bool _isValidPassword(String password) {
    final passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegex.hasMatch(password);
  }
}
