import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp3007/src/controller/controllers.dart';

import 'post_item_widget.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = DetailController.to;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Post Detail',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed: () => c.fetchPostbyId(),
              icon: const Icon(Icons.refresh, color: Colors.white))
        ],
      ),
      body: Center(
        child: Obx(
          ()=>
          c.isLoading.isTrue
                ? const CircularProgressIndicator()
                : PostItemWidget(item: c.seletedPost)),
      ),
    );
  }
}
