import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class HeaderInterceptor extends Interceptor {
  final Logger _logger;

  HeaderInterceptor(this._logger);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.contentType = Headers.jsonContentType;
    options.headers['Accept'] = 'application/json';

    _logger.d(
      '--> ${options.method} ${options.baseUrl}${options.path}\nQuery: ${options.queryParameters}\nContent type: ${options.contentType}\nHeaders: ${options.headers}\nRequest Body: ${options.data}\n<-- END HTTP',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i(
      '--> Response Code: ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.baseUrl}${response.requestOptions.path}\nQuery: ${response.requestOptions.queryParameters}\nHeaders: ${response.headers}Response Body: ${json.encode(response.data)}\n<-- END HTTP',
    );

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e(
      '<-- Error -->\nStatus: ${err.error}\nResponse: ${err.response}\n<-- End Error -->',
    );
    super.onError(err, handler);
  }
}
