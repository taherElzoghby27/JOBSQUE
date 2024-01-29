import 'package:http/http.dart' as http;

class PutApiService {
  Future<http.Response> put({
    required String path,
    Object? body,
    Map<String, String>? headers,
  }) async {
    //convert String to Uri
    Uri uri = Uri.parse(path);
    http.Response response = await http.put(uri, body: body, headers: headers);
    return response;
  }
}
