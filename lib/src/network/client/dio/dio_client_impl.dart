import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mvp3007/src/app/app_const.dart';
import 'package:mvp3007/src/network/client/dio/dio_client.dart';
import 'package:mvp3007/src/network/client/dio/dio_excep_custom.dart';
import 'package:mvp3007/src/network/client/dio/dio_interceptor_logs.dart';

enum DioMethod { post, get, put, delete, download }

class DioClientImpl extends DioClient {
  late Dio _dio;
  static const connectTimeout = Duration(seconds: 50);
  static const receiveTimeout = Duration(seconds: 30);

  @override
  Future<DioClient> init() async {
    _dio = Dio();
    _dio.interceptors.clear();
    _dio.interceptors.add(DioInterceptorLogs(printResponse: false));
    // _dio.interceptors.add(LogInterceptor(responseBody: true));
    // _dio.interceptors.add(DioAuthInterceptor(accessToken: 'token'));
    _dio.options.connectTimeout = connectTimeout;
    _dio.options.receiveTimeout = receiveTimeout;
    _dio.options.baseUrl = ApiConstants.dioBaseUrl ?? 'urlNotFound';
    _dio.options.headers = headers;
    _dio.options.contentType = Headers.jsonContentType;
    _dio.options.responseType = ResponseType.json;
    _dio.options.followRedirects = false;
    return this;
  }

  final Map<String, String> headers = {
    HttpHeaders.acceptHeader: Headers.jsonContentType,
    HttpHeaders.contentTypeHeader: Headers.jsonContentType,
  };

  @override
  Future getRequest(String url, Map<String, dynamic>? params) async {
    Response response;
    try {
      response = await _dio.get(url, queryParameters: params);
    } on DioException catch (e) {
      throw DioExcepCustom.fromDioError(
              dioError: e, errorFrom: 'DIO_GET_METHOD:')
          .errorMessage();
    }
    return response;
  }

  @override
  Future postRequest(String url, Map<String, dynamic>? params) async {
    Response response;
    try {
      response = await _dio.post(url, queryParameters: params);
    } on DioException catch (e) {
      throw DioExcepCustom.fromDioError(
              dioError: e, errorFrom: 'DIO_POST_METHOD:')
          .errorMessage();
    }
    return response;
  }

  @override
  Future postMultipartRequest(String url, Object? formData) async {
    Response response;
    try {
      response = await _dio.post(
        url,
        data: formData,
        options: Options(headers: {
          Headers.contentTypeHeader: Headers.multipartFormDataContentType,
        }),
        onSendProgress: (send, total) {
          if (total != -1) {
            debugPrint(
                'sendProgress: ${(send / total * 100).toStringAsFixed(0)}%');
          }
        },
        onReceiveProgress: (received, total) {
          if (total != -1) {
            debugPrint(
                'receiveProgress: ${(received / total * 100).toStringAsFixed(0)}%');
          }
        },
      );
    } on DioException catch (e) {
      throw DioExcepCustom.fromDioError(
              dioError: e, errorFrom: 'DIO_POST_METHOD:')
          .errorMessage();
    }
    return response;
  }

  @override
  Future setRequest(
      String url, DioMethod method, Map<String, dynamic>? params) async {
    Response response;
    try {
      switch (method) {
        case DioMethod.post:
          response = await _dio.post(url, queryParameters: params);
          break;
        case DioMethod.put:
          response = await _dio.put(url, queryParameters: params);
          break;
        case DioMethod.delete:
          response = await _dio.delete(url, queryParameters: params);
          break;
        case DioMethod.download:
          response = await _dio.download(url, ResponseType.plain);
          break;
        default:
          response = await _dio.get(url);
      }
    } on DioException catch (e) {
      throw DioExcepCustom.fromDioError(
              dioError: e, errorFrom: 'DIO_SET_METHOD:')
          .errorMessage();
    }
    return response;
  }
}
