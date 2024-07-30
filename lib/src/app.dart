import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/app_const.dart';
import 'app/app_route.dart';
import 'binding/bindings.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blog Post',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      enableLog: true, // can disable getx log
      initialBinding: InitialBinding(),
      initialRoute: initialRoute,
      getPages: setRoute,
    );
  }
}
