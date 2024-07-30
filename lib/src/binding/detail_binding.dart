import 'package:get/get.dart';
import 'package:mvp3007/src/app/app_const.dart';
import 'package:mvp3007/src/controller/controllers.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() async {
    // controllers DI
    Get.lazyPut(() => DetailController(),
        fenix: true, tag: tagDetailController);
  }
}
