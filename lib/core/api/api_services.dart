import 'dart:async';
import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;
  final Duration timeoutDuration;

  ApiServices(
    this.dio, {
    this.timeoutDuration = const Duration(seconds: 20),
  });

  CancelToken createCancelToken() {
    final cancelToken = CancelToken();
    Timer(timeoutDuration, () {
      if (!cancelToken.isCancelled) {
        cancelToken.cancel("Request cancelled due to timeout");
      }
    });
    return cancelToken;
  }

  Future<Response> postRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    final cancelToken = createCancelToken();
    return await dio.post(
      endpoint,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      cancelToken: cancelToken,
    );
  }

  Future<Response> getRequest({
    required String endpoint,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    final cancelToken = createCancelToken();
    return await dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      cancelToken: cancelToken,
    );
  }

  Future<Response> putRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    final cancelToken = createCancelToken();
    return await dio.put(
      endpoint,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      cancelToken: cancelToken,
    );
  }

  Future<Response> deleteRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    final cancelToken = createCancelToken();
    return await dio.delete(
      endpoint,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      cancelToken: cancelToken,
    );
  }

  Future<Response> patchRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    final cancelToken = createCancelToken();
    return await dio.patch(
      endpoint,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      cancelToken: cancelToken,
    );
  }
}
