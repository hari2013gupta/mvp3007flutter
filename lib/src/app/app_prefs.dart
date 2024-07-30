import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  static String isDarkMode = '_darkMode';
  putPrefBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<bool?> getPrefBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? result = prefs.getBool(key);
    return result;
  }

  putPrefString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getPrefString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? result = prefs.getString(key);
    return result;
  }
}
