import 'package:dio/dio.dart';
import 'package:fitfat/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errModel;

  ServerException({required this.errModel});
}

void handleDioException(DioException e) {
  ErrorModel parseErrorModel(dynamic data) {
    if (data is String) {
      return ErrorModel.fromString(data);
    } else if (data is Map<String, dynamic>) {
      return ErrorModel.fromJson(data);
    } else {
      return ErrorModel.fromString('Unknown error format');
    }
  }

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errModel: parseErrorModel(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(errModel: parseErrorModel(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(errModel: parseErrorModel(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(errModel: parseErrorModel(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(errModel: parseErrorModel(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(errModel: parseErrorModel(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(errModel: parseErrorModel(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw ServerException(errModel: parseErrorModel(e.response!.data));
        case 401:
          throw ServerException(errModel: parseErrorModel(e.response!.data));
        case 403:
          throw ServerException(errModel: parseErrorModel(e.response!.data));
        case 404:
          throw ServerException(errModel: parseErrorModel(e.response!.data));
        case 409:
          throw ServerException(errModel: parseErrorModel(e.response!.data));
        case 504:
          throw ServerException(errModel: parseErrorModel(e.response!.data));
        default:
          throw ServerException(errModel: parseErrorModel(e.response!.data));
      }
  }
}
