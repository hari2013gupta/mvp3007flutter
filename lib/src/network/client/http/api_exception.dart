class ApiException implements Exception {
  ApiException({required this.error, required this.message});

  final String error;
  final String message;

  @override
  String toString() {
    return 'Exception: $error ($message)';
  }
}
