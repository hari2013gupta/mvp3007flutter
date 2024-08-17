import 'package:get/get.dart';
import 'package:mvp3007/src/app/app_const.dart';
import 'package:mvp3007/src/model/post_model.dart';
import 'package:mvp3007/src/network/repo/post_dio_repo.dart';
import 'package:mvp3007/src/network/repo/post_repo.dart';

class PostController extends GetxController {
  static PostController get to => Get.find(tag: tagPostController);
  List<PostModel> postList = <PostModel>[].obs;
  late PostRepository _postRepository;
  late PostDioRepository _postDioRepository;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _postRepository = Get.find<PostRepositoryImpl>();
    _postDioRepository = Get.find<PostDioRepositoryImpl>();
    // fetchPosts();
    // fetchCreateOrderHttp();
    // fetchCreateOrderDio(orderId: 'orderId');
  }

  fetchPosts() async {
    postList.clear();
    isLoading(true);
    await _postRepository.getAllPosts().then((value) {
      isLoading(false);
      if (value != null) {
        postList.clear();
        postList.addAll(value);
      } else {
        appSnackbar('Alert', 'No data found!');
      }
    }).onError((error, stackTrace) {
      isLoading(false);
      error.printError();
      appSnackbar('Alert', 'Err: $error');
    });
  }

  fetchCreateOrderHttp({orderId}) async {
    isLoading(true);
    await _postRepository.postCreateOrder(orderId, 10).then((value) {
      isLoading(false);
      if (value != null) {
        print(value);
      } else {
        appSnackbar('Alert', 'No data found!');
      }
    }).onError((error, stackTrace) {
      isLoading(false);
      error.printError();
      appSnackbar('Alert', 'Err: $error');
    });
  }
  fetchCreateOrderDio({orderId}) async {
    isLoading(true);
    await _postDioRepository.postCreateOrder(orderId, 10).then((value) {
      isLoading(false);
      if (value != null) {
        print(value);
      } else {
        appSnackbar('Alert', 'No data found!');
      }
    }).onError((error, stackTrace) {
      isLoading(false);
      error.printError();
      appSnackbar('Alert', 'Err: $error');
    });
  }
}
