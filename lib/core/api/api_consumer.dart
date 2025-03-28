import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_interceptor.dart';

abstract class ApiConsumer {
  final Dio _dio = Dio()..interceptors.add(ApiInterceptor());
  get(
    String path, {
    Object? data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  });
  post(String path,
      {Object? data,
      Options? options,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false});
  patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
  delete(
    String path, {
    Object? data,
    Options? options,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
}
