import 'package:http/http.dart' as http;
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/services/api_service/service/post_api_service.dart';

import '../../../consts/api.dart';
import '../../../consts/strings.dart';

class UpdateNamePassService {
  PostApiService postApiService;

  UpdateNamePassService({required this.postApiService});

  //filter jobs method
  Future<http.Response> updateData({
    required String name,
    required String password,
  }) async {
    http.Response response = await postApiService.post(
      path: "${ApiConsts.url}${ApiConsts.updateNamePassEndPoint}",
      body: {
        'name': name,
        'password': password,
      },
      headers: {
        'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
      },
    );

    return response;
  }
}
