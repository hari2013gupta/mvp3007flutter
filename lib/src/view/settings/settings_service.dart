import 'package:flutter/material.dart';
import 'package:mvp3007/src/app/app_prefs.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {
    final result = await AppPrefs().getPrefBool(AppPrefs.isDarkMode);
    debugPrint('---------------result-------->$result');
    switch (result) {
      case true:
        return ThemeMode.dark;
      default:
        return ThemeMode.light;
    }
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    switch (theme) {
      case ThemeData.dark:
        AppPrefs().putPrefBool(AppPrefs.isDarkMode, true);
      case ThemeData.light:
      default:
        AppPrefs().putPrefBool(AppPrefs.isDarkMode, false);
    }
  }
}
