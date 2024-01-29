import 'package:http/http.dart' as http;

class GetApiService {
  Future<http.Response> get({
    required String path,
    Map<String, String>? headers,
  }) async {
    //convert String to Uri
    Uri uri = Uri.parse(path);
    http.Response response = await http.get(uri, headers: headers);
    return response;
  }
}
