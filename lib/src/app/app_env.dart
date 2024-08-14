import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironment {
  static String get fileName => kReleaseMode ? "assets/env/prod.env" : "assets/env/dev.env";
  static String get baseUrl =>
      dotenv.env['UAT_BASE_URL_HTTP'] ?? 'http://localhost:4000/';
  static String localhost = dotenv.get('LOCALHOST');
  static String apiKey =
      dotenv.get('API_KEY', fallback: dotenv.get('API_KEY0'));
  static final username = dotenv.get('USER_NAME', fallback: null);
  static final password = dotenv.get('USER_PASS', fallback: null);

  static final razorpayKey = dotenv.get('RAZORPAY_KEY', fallback: null);
}
