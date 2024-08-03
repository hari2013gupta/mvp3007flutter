import 'package:get/get.dart';
import 'api_client_impl.dart';

abstract class ApiClient extends GetxService {

  Future<ApiClient> init();

  Future<dynamic> getRequest(String url, Map<String, dynamic>? params);

  Future<dynamic> postRequest(String url, Map<String, dynamic>? params);

  Future<dynamic> postMultipartRequest(String url, Object? formData);

  Future<dynamic> setRequest(String url, HttpMethod method, Map<String, dynamic>? params);
  
}