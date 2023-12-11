import 'package:http/http.dart' as http;

class PostApiService {
  Future<http.Response> post({
    required String path,
    Object? body,
    Map<String, String>? headers,
  }) async {
    //convert String to Uri
    Uri uri = Uri.parse(path);
    http.Response response = await http.post(uri, body: body, headers: headers);
    return response;
  }
}
