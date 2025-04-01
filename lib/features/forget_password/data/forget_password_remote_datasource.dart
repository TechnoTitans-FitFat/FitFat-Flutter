import 'package:dio/dio.dart';

class ForgotPasswordRemoteDatasource {
  final Dio _dio = Dio();

  static const String _baseUrl = 'https://fitfat-backend.up.railway.app';

  Future<Map<String, dynamic>> sendPasswordResetOtp(String email) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/forgot-password',
        data: {'email': email},
        options: Options(contentType: Headers.jsonContentType),
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> verifyResetOtp(String email, String otp) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/verify-reset-otp',
        data: {'email': email, 'otp': otp},
        options: Options(contentType: Headers.jsonContentType),
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> resetPassword(
      String newPassword, String confirmPassword, String resetToken) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/reset-password',
        data: {'newPassword': newPassword, 'confirmPassword': confirmPassword},
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {'Authorization': 'Bearer $resetToken'},
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // Helper method to handle Dio errors
  dynamic _handleDioError(DioException e) {
    if (e.response != null) {
      return e.response?.data['message'] ??
          'An error occurred while processing your request';
    }
    return 'Network error. Please check your connection.';
  }
}
