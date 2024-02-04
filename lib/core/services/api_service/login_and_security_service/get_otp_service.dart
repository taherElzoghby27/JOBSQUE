import 'package:http/http.dart' as http;
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/services/api_service/api_service.dart';

import '../../../consts/api.dart';
import '../../../consts/strings.dart';

class GetOtpService {
  ApiService apiService;

  GetOtpService({required this.apiService});

  //filter jobs method
  Future<http.Response> getOtp({
    required String email,
  }) async {
    http.Response response = await apiService.post(
      path: "${ApiConsts.getOtpEndPoint}",
      body: {'email': email},
      headers: {
        'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
      },
    );

    return response;
  }
}
