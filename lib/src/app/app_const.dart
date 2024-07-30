// All routes
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const initialRoute = '/';
const detailRoute = '/detail';

// All controllers
const tagPostController = 'post_controller';
const tagDetailController = 'detail_controller';

// Api constants
class ApiConstants {
  static const baseUrl = 'https://jsonplaceholder.typicode.com/';
  static const postApi = 'posts';
}

appSnackbar(title, message) => Get.snackbar(
      title ?? 'Alert', message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blueAccent,
      icon: const Icon(Icons.info_outline_rounded, color: Colors.white),
      colorText: Colors.white,
      borderColor: Colors.white, //use borderColor,radius,width simulteneously
      borderRadius: 4,
      borderWidth: 1,
      barBlur: 0,
      overlayBlur: 0.05,
      overlayColor: Colors.transparent,
      onTap: (v) => debugPrint('dismiss me'),
      snackbarStatus: (status) => debugPrint(status.toString()),
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      margin: const EdgeInsets.all(15),
      duration: const Duration(milliseconds: 2100),
      animationDuration: 400.milliseconds,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
