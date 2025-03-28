import 'package:dio/dio.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
        CacheHelper().getData(key: ApiKey.token) != null
            ? CacheHelper().getData(key: ApiKey.token)
            : null;
    options.headers.addAll({'Authorization': 'Bearer ${ApiKey.token}'});
    super.onRequest(options, handler);
  }
}
