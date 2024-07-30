import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp3007/src/app/app_const.dart';
import 'package:mvp3007/src/model/post_model.dart';
import 'package:mvp3007/src/network/repo/post_repo.dart';

class DetailController extends GetxController {
  static DetailController get to => Get.find(tag: tagDetailController);
  late PostModel seletedPost;
  var isLoading = false.obs;

  late PostRepository _postRepository;
  int postId = 0;

  @override
  void onInit() {
    super.onInit();
    _postRepository = Get.find<PostRepositoryImpl>();
    final args = Get.arguments;
    debugPrint('initial argument=$args');
    seletedPost = PostModel(uId: 0, id: 0, title: 'No post found!', body: '');
    if (args != null) {
      postId = args['post_id'];
      fetchPostbyId();
    }
  }

  void fetchPostbyId() async {
    seletedPost = PostModel(uId: 0, id: 0, title: 'No post found!', body: '');
    isLoading(true);
    await _postRepository.getOnePost(postId).then((result) {
      if (result != null) {
        seletedPost = result;
      } else {
        appSnackbar('Alert', 'No data found!');
      }
      isLoading(false);
    }).onError((error, stackTrace) {
      isLoading(false);
      error.printError();
      appSnackbar('Alert', 'Err: $error');
    });
    isLoading(false);
  }
}
