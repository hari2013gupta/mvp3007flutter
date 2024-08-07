part of '../iconnection.dart';

/// Represents the result of an internet connection check.
///
/// This class encapsulates the outcome of an internet connection check
/// performed with a specific [NetOption].
class NetResult {
  /// Creates an [NetResult] instance.
  ///
  /// Represents the result of an internet connection check.
  ///
  /// This class encapsulates the outcome of an internet connection check
  /// performed with a specific [NetOption].
  NetResult({
    required this.isSuccess,
    required this.option,
  });

  /// The option used to check internet connection for this result.
  final NetOption option;

  /// The result of the internet connection check for the given [option].
  ///
  /// If `true`, then HEAD request to the given [option] was successful.
  /// Otherwise, it was unsuccessful.
  final bool isSuccess;

  @override
  String toString() {
    return 'NetResult(\n'
        '  option: ${option.toString().replaceAll('\n', '\n  ')},\n'
        '  isSuccess: $isSuccess\n'
        ')';
  }
}