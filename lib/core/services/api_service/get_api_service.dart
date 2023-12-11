import 'package:http/http.dart' as http;

class GetApiService {
  Future<http.Response> post({required String path}) async {
    //convert String to Uri
    Uri uri = Uri.parse(path);
    http.Response response = await http.get(uri);
    return response;
  }
}
