import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:mvp3007/src/app/app_const.dart';

abstract class NetworkExcepCustom {
  static String handleResponse(Response response) {
    int statusCode = response.statusCode ?? 0;
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        getx.Get.offAllNamed(initialRoute);
        return "Unauthorized request. Please log in again.";
      case 404:
        return "Requested resource not found.";
      case 409:
        return "Error due to a conflict. Please try again later.";
      case 408:
        return "Connection request timeout. Please try again later.";
      case 500:
        return "Internal server error. Please try again later.";
      case 503:
        return "Service unavailable. Please try again later.";
      default:
        return "Received invalid status code.";
    }
  }

  static String getDioException(error) {
    if (error is Exception) {
      try {
        var errorMessage = "";
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorMessage = "Request cancelled.";
              break;
            case DioExceptionType.connectionTimeout:
              errorMessage =
                  "Connection request timeout. Please try again later.";
              break;
            case DioExceptionType.unknown:
              errorMessage = "No internet connection.";
              break;
            case DioExceptionType.receiveTimeout:
              errorMessage =
                  "Send timeout in connection with API server. Please try again later.";
              break;
            case DioExceptionType.badResponse:
              if (error.response == null) {
                errorMessage =
                    NetworkExcepCustom.handleResponse(error.response!);
              } else {
                errorMessage = "Network error";
              }
              break;
            case DioExceptionType.sendTimeout:
              errorMessage =
                  "Send timeout in connection with API server. Please try again later.";
              break;
            default:
              errorMessage = "Something went wrong.";
              break;
          }
        } else if (error is SocketException) {
          errorMessage = "No internet connection.";
        } else {
          errorMessage = "Unexpected error occurred. Please try again later.";
        }
        return errorMessage;
      } on FormatException {
        return "Unexpected error occurred. Please try again later.";
      } catch (_) {
        return "Unexpected error occurred. Please try again later.";
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return "Unable to process the data. Please try again later.";
      } else {
        return "Unexpected error occurred. Please try again later.";
      }
    }
  }
}
