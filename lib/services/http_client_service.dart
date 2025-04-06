import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http_client;

class HttpClientService {
  final String _baseUrl = dotenv.env['BASE_CAT_API_URL']!;
  final String? _apiKey = dotenv.env['API_KEY'];

  HttpClientService();

  Future<http_client.Response> getList(String endpoint) async {
    final response = await http_client.get(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': _apiKey ?? '',
      },
    );
    return response;
  }
}
