import 'package:http/http.dart' as http;
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/services/api_service/api_service.dart';

import '../../../consts/api.dart';
import '../../../consts/strings.dart';

class UpdateNamePassService {
  ApiService apiService;

  UpdateNamePassService({required this.apiService});

  //filter jobs method
  Future<http.Response> updateData({
    required String name,
    required String password,
  }) async {
    http.Response response = await apiService.post(
      path: "${ApiConsts.updateNamePassEndPoint}",
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
