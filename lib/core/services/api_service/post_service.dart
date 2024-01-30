import 'package:http/http.dart' as http;
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/services/api_service/service/post_api_service.dart';

import '../../consts/api.dart';
import '../../consts/strings.dart';

class GetOtp {
  PostApiService postApiService;

  GetOtp({required this.postApiService});

  //filter jobs method
  Future<http.Response> getOtp({
    required String email,
  }) async {
    http.Response response = await postApiService.post(
      path: "${ApiConsts.url}${ApiConsts.getOtpEndPoint}",
      body: {'email': email},
      headers: {
        'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
      },
    );

    return response;
  }
}
