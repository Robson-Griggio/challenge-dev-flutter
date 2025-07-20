import 'package:http/http.dart' as http;

class HttpClientUtil {
  final String baseUrl;
  final Map<String, String> defaultHeaders;

  HttpClientUtil({
    required this.baseUrl,
    this.defaultHeaders = const {'Content-Type': 'application/json'},
  });

  Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: {...defaultHeaders, ...?headers},
    );
    return response;
  }

  Future<http.Response> post(
    String endpoint,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {...defaultHeaders, ...?headers},
      body: body,
    );
    return response;
  }

  Future<http.Response> put(
    String endpoint,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: {...defaultHeaders, ...?headers},
      body: body,
    );
    return response;
  }

  Future<http.Response> delete(
    String endpoint,
    String id, {
    Map<String, String>? headers,
  }) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint/$id'),
      headers: {...defaultHeaders, ...?headers},
    );
    return response;
  }
}
