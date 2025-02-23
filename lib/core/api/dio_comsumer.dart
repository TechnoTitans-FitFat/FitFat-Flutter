import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_consumer.dart';

class DioComsumer extends ApiConsumer {
  final Dio dio;

  DioComsumer({required this.dio});
  @override
  delete(String path,
      {dynamic? data, Map<String, dynamic>? queryParameters}) async {
    try {
  final response =
      await dio.delete(path, data: data, queryParameters: queryParameters);
  return response.data;
} on DioException catch (e) {
  
}
    
  }

  @override
  get(String path, {dynamic? data, Map<String, dynamic>? queryParameters}) {}

  @override
  patch(String path, {dynamic? data, Map<String, dynamic>? queryParameters}) {}

  @override
  post(String path, {dynamic? data, Map<String, dynamic>? queryParameters}) {}
}
