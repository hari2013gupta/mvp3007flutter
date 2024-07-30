import 'package:get/get.dart';
import 'package:mvp3007/src/network/client/dio_client_impl.dart';

abstract class DioClient extends GetxService {

  Future<DioClient> init();

  Future<dynamic> getRequest(String url, Map<String, dynamic>? params);

  Future<dynamic> postRequest(String url, Map<String, dynamic>? params);

  Future<dynamic> postMultipartRequest(String url, Object? formData);

  Future<dynamic> setRequest(String url, DioMethod method, Map<String, dynamic>? params);
  
}