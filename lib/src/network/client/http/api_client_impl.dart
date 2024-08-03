import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'api_client.dart';

enum HttpMethod { post, get, put, delete, download }

class ApiClientImpl extends ApiClient {
  late http.Client httpCall;
  static const connectTimeout = Duration(seconds: 50);
  static const receiveTimeout = Duration(seconds: 30);

  @override
  Future<ApiClient> init() async {
    httpCall = http.Client();
    return this;
  }

  @override
  Future getRequest(String url, Map<String, dynamic>? params) async {
    final Map<String, String> headers = {
      HttpHeaders.acceptHeader: Headers.jsonContentType,
      HttpHeaders.contentTypeHeader: Headers.jsonContentType,
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode != 200) {
        throw HttpException('${response.statusCode}');
      }
      final jsonMap = jsonDecode(response.body);
    } on SocketException {
      print('No Internet connection 😑');
    } on HttpException {
      print("Couldn't find the post 😱");
    } on FormatException {
      print("Bad response format 👎");
    }
    debugPrint('---------------');
  }

  @override
  Future postMultipartRequest(String url, Object? formData) {
    // TODO: implement postMultipartRequest
    throw UnimplementedError();
  }

  @override
  Future postRequest(String url, Map<String, dynamic>? params) {
    // TODO: implement postRequest
    throw UnimplementedError();
  }

  @override
  Future setRequest(
      String url, HttpMethod method, Map<String, dynamic>? params) {
    // TODO: implement setRequest
    throw UnimplementedError();
  }
}
