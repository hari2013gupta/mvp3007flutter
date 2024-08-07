import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp3007/src/app/app_const.dart';
import 'package:mvp3007/src/model/post_model.dart';
import 'package:mvp3007/src/network/client/http/api_client.dart';
import 'package:mvp3007/src/network/client/http/api_client_impl.dart';

abstract class PostRepository {
  Future<List<PostModel>?> getAllPosts();
  Future<PostModel?> getOnePost(int index);
}

class PostRepositoryImpl extends PostRepository {
  late ApiClient _client;

  PostRepositoryImpl() {
    _client = Get.put(ApiClientImpl());
  }

  @override
  Future<List<PostModel>?> getAllPosts() async {
    final http.Response response;
    try {
      Map<String, dynamic>? params = {};
      response = await _client.getRequest(ApiConstants.postApi, params);

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final resultList =
            (result as List).map((x) => PostModel.fromJson(x)).toList();
        return resultList;
      }
      return null;
    } on http.ClientException catch (e) {
      debugPrint(e.message);
      return null;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<PostModel?> getOnePost(int index) async {
    final http.Response response;
    try {
      Map<String, dynamic>? params = {'id': index};
      params = params.map((key, value) => MapEntry(key, value.toString()));

      final path = '${ApiConstants.postApi}/$index';
      response = await _client.getRequest(path, params);

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return PostModel.fromJson(result);
      }
      return null;
    } on http.ClientException catch (e) {
      debugPrint(e.message);
      return null;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
