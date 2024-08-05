import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioInterceptorLogs extends Interceptor {
  DioInterceptorLogs({this.printResponse = false});
  final bool printResponse;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(
      'REQUEST[${options.method}] => PATH: ${options.path} '
      // '=> HEADERS: ${options.headers} '
      '=> Request Param: ${options.data} '
      '=> Request Query: ${options.queryParameters} ',
    );
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final condition = printResponse ? response.data : '[RES_NOT_SHOWN]';
    debugPrint(
      'RESPONSE[${response.statusCode},${response.statusMessage}] => PATH: ${response.requestOptions.path}' // '\n=> HEADERS: ${response.headers}'
      '=> DATA: $condition',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
      'ERROR[${err.response?.statusCode},${err.response?.statusMessage}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}
