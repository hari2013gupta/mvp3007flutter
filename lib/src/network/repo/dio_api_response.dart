import 'package:dio/dio.dart';

class ApiResponse<T> {
  final T? data;
  final DioException? error;
  final int? statusCode;

  ApiResponse({this.data, this.error, this.statusCode});

  bool get isSuccess => error == null;

  // Example data parsing method
  // T? parseData(dynamic response) {
  //   // Implement your data parsing logic here
  //   // For example, if you're using JSON:
  //   if (response is Map<String, dynamic>) {
  //     return T.fromJson(response);
  //   }
  //   return null;
  // }
}
