import 'package:fitfat/features/forget_password/data/forget_password_remote_datasource.dart';

class ForgotPasswordRepository {
  final ForgotPasswordRemoteDatasource _remoteDatasource;

  ForgotPasswordRepository(this._remoteDatasource);

  Future<Map<String, dynamic>> sendPasswordResetOtp(String email) async {
    // Add any additional validation or business logic here
    return await _remoteDatasource.sendPasswordResetOtp(email);
  }

  Future<Map<String, dynamic>> verifyResetOtp(String email, String otp) async {
    // Add any additional validation or business logic here
    return await _remoteDatasource.verifyResetOtp(email, otp);
  }

  Future<Map<String, dynamic>> resetPassword(
      String newPassword, String confirmPassword, String resetToken) async {
    // Add any additional validation or business logic here
    return await _remoteDatasource.resetPassword(
        newPassword, confirmPassword, resetToken);
  }
}
