part of '../iconnection.dart';

/// Enum representing the status of internet connectivity.
///
/// This enum defines two possible values to represent the status of internet
/// connectivity: `connected` and `disconnected`.
///
/// *Usage Example:*
///
/// ```dart
/// if (status == NetStatus.connected) {
///   print('Internet is available!');
/// } else {
///   print('No internet connection.');
/// }
/// ```
enum NetStatus {
  /// Internet is available because at least one of the HEAD requests succeeded.
  connected,

  /// None of the HEAD requests succeeded. Basically, no internet.
  disconnected,
}