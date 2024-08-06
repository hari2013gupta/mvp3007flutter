import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mvp3007/src/app/app_env.dart';
import 'package:mvp3007/src/network/client/dio/dio_client.dart';
import 'package:mvp3007/src/network/client/dio/dio_client_impl.dart';
import 'package:mvp3007/src/network/client/http/api_client.dart';
import 'package:mvp3007/src/network/client/http/api_client_impl.dart';

import 'src/app.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: AppEnvironment.fileName);
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
  await Get.putAsync<DioClient>(() => DioClientImpl().init());
  await Get.putAsync<ApiClient>(() => ApiClientImpl().init());
}
