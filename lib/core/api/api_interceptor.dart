import 'package:dio/dio.dart';

/*class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
        CacheHelper().getData(key: ApiKey.token);
    options.headers.addAll({'Authorization': 'Bearer ${ApiKey.token}'});
    super.onRequest(options, handler);
  }
}
*/
class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    super.onRequest(options, handler);
  }
}
