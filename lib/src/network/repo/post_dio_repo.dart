import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp3007/src/app/app_const.dart';
import 'package:mvp3007/src/model/post_model.dart';
import 'package:mvp3007/src/network/client/dio/dio_client.dart';
import 'package:mvp3007/src/network/client/dio/dio_client_impl.dart';

abstract class PostDioRepository {
  Future<List<PostModel>?> getAllPosts();
  Future<PostModel?> getOnePost(int index);
  Future<String?> postCreateOrder(String orderId, int orderAmount);
}

class PostDioRepositoryImpl extends PostDioRepository {
  late DioClient _client;

  PostDioRepositoryImpl() {
    _client = Get.put(DioClientImpl());
  }

  @override
  Future<List<PostModel>?> getAllPosts() async {
    final Response response;
    try {
      response = await _client.getRequest(ApiConstants.postApi, {});
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final resultList =
            (result as List).map((x) => PostModel.fromJson(x)).toList();
        return resultList;
      }
      return null;
    } on dio.DioException catch (e) {
      debugPrint(e.message);
      return null;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<PostModel?> getOnePost(int index) async {
    final dio.Response response;
    try {
      // final formData = FormData.fromMap({
      //   'name': 'dio',
      //   'date': DateTime.now().toIso8601String(),
      //   'file':
      //       await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
      //   'files': [
      //     await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
      //     await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
      //   ]
      // });
      var params = {'id': index};
      response =
          await _client.getRequest('${ApiConstants.postApi}/$index', params);

      if (response.statusCode == 200) {
        return PostModel.fromJson(response.data);
      }
      return null;
    } on dio.DioException catch (e) {
      debugPrint(e.message);
      return null;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String?> postCreateOrder(String orderId, int orderAmount) async {
    final Response response;
    try {
      Map<String, dynamic>? params = {
        "aggregatorId": "SBIEPAY",
        "merchantId": "1000003",
        "merchantOrderNo": "M15545645644565$orderId",
        "merchantCustomerId": "CUST0012",
        "merchantPostedAmount": 1000.50,
        "merchResponseUrl": "https://merchant.com/response2",
        "merchOtherDetails": "Additional details2",
        "payModeCode": "PM0012",
        "sourceUrl": "https://merchant.com/source2",
        "procStatus": "P",
        "creationDate": "2024-07-20T14:30:00Z",
        "transactionSource": "ONLINE",
        "creditInstructions": "Credit to account",
        "webServer": "server1",
        "clientIpAddress": "192.168.1.12",
        "modifiedDate": "2024-07-21T10:15:00Z",
        "challanExpiryDate": "2024-08-20T00:00:00Z",
        "creationDtNum": null
      };
      params = params.map((key, value) => MapEntry(key, value.toString()));

      const path = ApiConstants.createOrderApi;
      response = await _client.postRequest(path, params);

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return result.toString();
      }
      return null;
    } on dio.DioException catch (e) {
      debugPrint(e.message);
      return null;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
