import 'package:http/http.dart' as http;
import 'package:jobsque/core/consts/strings.dart';

import '../../helper/cache_helper.dart';

class ApiService {
  static const url = 'https://project2.amit-learning.com/api';

  //get method
  Future<http.Response> get({
    required String path,
    Map<String, String>? headers,
  }) async {
    //convert String to Uri
    Uri uri = Uri.parse("$url$path");
    http.Response response = await http.get(
      uri,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
      },
    );
    return response;
  }

  //post method
  Future<http.Response> post({
    required String path,
    Object? body,
    Map<String, String>? headers,
  }) async {
    //convert String to Uri
    Uri uri = Uri.parse("$url$path");
    http.Response response = await http.post(
      uri,
      body: body,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
      },
    );
    return response;
  }

  //put method
  Future<http.Response> put({
    required String path,
    Object? body,
    Map<String, String>? headers,
  }) async {
    //convert String to Uri
    Uri uri = Uri.parse("$url$path");
    http.Response response = await http.put(
      uri,
      body: body,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
      },
    );
    return response;
  }
}
