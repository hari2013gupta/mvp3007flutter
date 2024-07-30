import 'package:get/get.dart';
import 'package:mvp3007/src/app/app_const.dart';
import 'package:mvp3007/src/binding/bindings.dart';
import 'package:mvp3007/src/view/views.dart';


List<GetPage<dynamic>> get setRoute => [
      GetPage(
        name: initialRoute,
        page: () => const PostView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 200),
        bindings: [PostBinding()],
      ),
      GetPage(
        name: detailRoute,
        page: () => const DetailView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 250),
        bindings: [DetailBinding()],
      ),
    ];
