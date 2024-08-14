import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mvp3007/src/app/app_env.dart';

import 'api_client.dart';

enum HttpMethod { post, get, put, delete, download }

class ApiClientImpl extends ApiClient {
  late http.Client httpClient;
  static const connectTimeout = Duration(seconds: 50);
  static const receiveTimeout = Duration(seconds: 30);

  @override
  Future<ApiClient> init() async {
    httpClient = http.Client();
    return this;
  }

  @override
  Future getRequest(String path, Map<String, dynamic>? params) async {
    final Map<String, String> headers = {
      HttpHeaders.acceptHeader: Headers.jsonContentType,
      HttpHeaders.contentTypeHeader: Headers.jsonContentType,
    };
    http.Response? response;
    try {
      var httpUrl = Uri.https(AppEnvironment.baseUrl, path, params);
      response = await httpClient.get(httpUrl, headers: headers);

      debugPrint('GET Response status: ${response.statusCode}');
      // debugPrint(await http.read(Uri.https('example.com', 'foobar.txt')));
      if (response.statusCode != 200) {
        throw HttpException('${response.statusCode}');
      }
    } on SocketException {
      debugPrint('No Internet connection 😑');
    } on HttpException {
      debugPrint("Couldn't find the post 😱");
    } on FormatException {
      debugPrint("Bad response format 👎");
    } on Exception {
      debugPrint("Something went wrong!!!");
    }
    debugPrint('---------------');
    return response;
  }

  @override
  Future postMultipartRequest(String url, Object? formData) {
    // TODO: implement postMultipartRequest
    throw UnimplementedError();
  }

  @override
  Future postRequest(String path, Map<String, dynamic>? params) async {
    final Map<String, String> headers = {
      HttpHeaders.acceptHeader: Headers.jsonContentType,
      HttpHeaders.contentTypeHeader: Headers.jsonContentType,
    };
    http.Response? response;
    try {
      debugPrint('-----------URL BSDR:_____${AppEnvironment.baseUrl}');
      var httpUrl = Uri.https(AppEnvironment.baseUrl, path, params);
      response = await httpClient.post(httpUrl, headers: headers, body: params);

      debugPrint('POST Response status: ${response.statusCode}');
      if (response.statusCode != 200) {
        throw HttpException('${response.statusCode}');
      }
    } on SocketException {
      debugPrint('No Internet connection 😑');
    } on HttpException {
      debugPrint("Couldn't find the post 😱");
    } on FormatException {
      debugPrint("Bad response format 👎");
    } on Exception {
      debugPrint("Something went wrong!!!");
    }
    debugPrint('---------------');
    return response;
  }

  @override
  Future setRequest(
      String url, HttpMethod method, Map<String, dynamic>? params) {
    // TODO: implement setRequest
    throw UnimplementedError();
  }
}
