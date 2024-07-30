import 'dart:io';

import 'package:dio/dio.dart';

class DioInterceptorAuth extends Interceptor {
  final String accessToken;

  DioInterceptorAuth({required this.accessToken});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
    super.onRequest(options, handler);
  }
}