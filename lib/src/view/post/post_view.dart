import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp3007/src/app/app_const.dart';
import 'package:mvp3007/src/controller/controllers.dart';

import 'post_item_widget.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PostController.to;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Posts',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed: () => controller.fetchPosts(),
              icon: const Icon(Icons.refresh, color: Colors.white))
        ],
      ),
      body: Center(
        child: Obx(
          () => controller.isLoading.isTrue
              ? const CircularProgressIndicator()
              : controller.postList.isEmpty
                  ? const Text('No blog post found!')
                  : ListView.builder(
                      itemCount: controller.postList.length,
                      itemBuilder: (context, index) {
                        final item = controller.postList[index];
                        return GestureDetector(
                          onTap: () => Get.toNamed(detailRoute,
                              arguments: {'post_id': item.id}),
                          child: PostItemWidget(item: item),
                        );
                      }),
        ),
      ),
    );
  }
}
