import 'package:get/get.dart';
import 'package:mvp3007/src/network/repo/post_dio_repo.dart';
import 'package:mvp3007/src/network/repo/post_repo.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    // repo DI
    Get.lazyPut(() => PostRepositoryImpl(), fenix: true);
    Get.lazyPut(() => PostDioRepositoryImpl(), fenix: true);
    
  }
}
