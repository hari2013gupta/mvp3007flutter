/// A utility package for checking internet connectivity status in Flutter
/// applications.
///
/// This library provides functionality to monitor and verify internet
/// connectivity by checking reachability to various [Uri]s. It relies on the
/// [connectivity_plus] package for listening to connectivity changes and the
/// [http][http_link] package for making network requests.
///
/// [connectivity_plus]: https://pub.dev/packages/connectivity_plus
/// [http_link]: https://pub.dev/packages/http
///
/// <br />
///
/// ## Usage
///
/// <hr />
///
/// ### Checking for internet connectivity
///
/// The simplest way to check for internet connectivity is to use the
/// [InternetConnection] class.
///
/// ```dart
/// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
///
/// bool result = await InternetConnection().hasInternetAccess;
/// ```
///
/// <br />
///
/// ### Listening for internet connectivity changes
///
/// The [InternetConnection] class also provides a [Stream] of
/// [NetStatus]es that can be used to listen for changes in internet
/// connectivity.
///
/// ```dart
/// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
///
/// final listener = InternetConnection().onStatusChange.listen(
///   (InternetStatus status) {
///     switch (status) {
///       case InternetStatus.connected:
///         // The internet is now connected
///         break;
///       case InternetStatus.disconnected:
///         // The internet is now disconnected
///         break;
///     }
///   },
/// );
/// ```
///
/// Don't forget to cancel the subscription when it is no longer needed. This
/// will prevent memory leaks and free up resources.
///
/// ```dart
/// listener.cancel();
/// ```
library iconnection;

// Dart Packages
import 'dart:async';

// Flutter Packages
import 'package:flutter/foundation.dart';

// Third Party Packages
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

// Package Files
part 'net/net_option.dart';
part 'net/net_result.dart';
part 'net/net_connection.dart';
part 'net/net_status.dart';