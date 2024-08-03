import 'package:http/http.dart' as http;

class ApiInterceptorAuth {
  final String authToken;

  ApiInterceptorAuth({required this.authToken});

  Future<http.Response> authInterceptor(http.Request request) async {
    request.headers['Authorization'] = 'Bearer $authToken';
    return await http.Response.fromStream(await request.send());
  }
}
