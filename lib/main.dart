import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp3007/src/network/client/dio_client.dart';
import 'package:mvp3007/src/network/client/dio_client_impl.dart';

import 'src/app.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    initServices();

    FlutterError.onError = (FlutterErrorDetails details) {
      catchUnhandledExceptions(details.exception, details.stack);
    };
    runApp(const App());
  }, (error, stack) => catchUnhandledExceptions);
}

void catchUnhandledExceptions(Object error, StackTrace? stack) {
  // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  debugPrintStack(stackTrace: stack, label: error.toString());
}

initServices() async {
  if (kDebugMode) {
    print('Starting services ...');
  }
  // dio clinet service
  await Get.putAsync<DioClient>(() => DioClientImpl().init());
}
