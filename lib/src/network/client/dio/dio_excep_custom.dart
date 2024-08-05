import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';

class DioExcepCustom implements Exception {
  static late String message;
  static int statusCode = -1;

  DioExcepCustom.fromDioError(
      {required dio.DioException dioError, required String? errorFrom}) {
    //This will print error is Json format and colorful
    _prettyPrintError(dioError: dioError, errorFrom: errorFrom);
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (dioError.response != null) {
      statusCode = dioError.response!.statusCode ?? -1;
      message = _handleError(statusCode, dioError.response!.statusMessage);
      if (statusCode != -1) {
        return;
      }
    }
    switch (dioError.type) {
      case dio.DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case dio.DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case dio.DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case dio.DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case dio.DioExceptionType.connectionError:
        message = "The connection errored";
        break;
      case dio.DioExceptionType.badResponse:
        message = "Bad response errored";
        break;
      case dio.DioExceptionType.badCertificate:
        message = "Bad certificate";
        break;
      case dio.DioExceptionType.unknown:
        var condition = dioError.message ?? "unknown error";
        if (condition.contains("SocketException")) {
          message = 'No Internet';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    String message = error;
    switch (statusCode) {
      case 400:
        message = 'Bad request';
      case 401:
        message = 'Unauthorized';
      case 403:
        message = 'Forbidden';
      case 404:
        message = '404: Not found';
      case 500:
        message = 'Internal server error';
      case 502:
        message = 'Bad gateway';
      case -1:
        message = 'Something went wrong - $error';
      default:
        message = 'Oops something went wrong - $error';
    }
    return message;
  }

  String errorMessage() => message;

  int errorStatusCode() => statusCode;

  void _prettyPrintError(
      {required dio.DioException dioError, required String? errorFrom}) {
    debugPrint(
        '\x1B[31m${"********************************************************"}\x1B[0m');
    debugPrint(
        '\x1B[31m${"🚨 ERROR - $errorFrom"} Status Code: ${dioError.response?.statusCode ?? -1}\x1B[0m');
    try {
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      String prettyprint = encoder.convert(dioError.response?.data ?? '');
      debugPrint(
          '\x1B[31m${"********************************************************"}\x1B[0m');
      log("🕵️$errorFrom Error Response: $prettyprint", name: "Error");
      debugPrint(
          '\x1B[31m🕵️ ERROR - $errorFrom Err Response: $prettyprint\x1B[0m');
    } catch (e) {
      log("🕵️ $errorFrom Error Response :\n${dioError.response?.data ?? ''}",
          name: "Error");
    } finally {
      debugPrint(
          '\x1B[31m${"********************************************************"}\x1B[0m');
    }
  }
}
