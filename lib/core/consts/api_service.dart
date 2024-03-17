import 'package:dio/dio.dart';
import 'package:jobsque/core/consts/strings.dart';

import '../helper/cache_helper.dart';

class ApiService {
  final Dio dio;
  static const url = 'https://project2.amit-learning.com/api';

  ApiService({required this.dio});

  //get method
  Future<Map<String, dynamic>> get({
    required String path,
    Map<String, String>? headers,
  }) async {
    Options options = Options();

    // Add headers to the options
    options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
    };
    Response response = await dio.get("$url$path", options: options);
    return response.data;
  }

  //post method
  Future<Map<String, dynamic>> post({
    required String path,
    Object? body,
  }) async {
    Options options = Options();
    // Add headers to the options
    options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
    };
    Response response = await dio.post(
      "$url$path",
      data: body,
      options: options,
    );
    return response.data;
  }

  //put method
  Future<Map<String, dynamic>> put({
    required String path,
    Object? body,
  }) async {
    Options options = Options();
    // Add headers to the options
    options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
    };
    Response response = await dio.put(
      "$url$path",
      data: body,
      options:options,
    );
    return response.data;
  }
  //delete method
  Future<Map<String, dynamic>> delete({
    required String path,
    Object? body,
  }) async {
    Options options = Options();
    // Add headers to the options
    options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
    };
    Response response = await dio.delete(
      "$url$path",
      data: body,
      options:options,
    );
    return response.data;
  }
}
