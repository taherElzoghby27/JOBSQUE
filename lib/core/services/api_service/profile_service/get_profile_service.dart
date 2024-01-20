// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/core/services/api_service/get_api_service.dart';

class GetProfileService {
  GetApiService getApiService;
  GetProfileService({required this.getApiService});
  //get profile method
  Future<http.Response> getProfile() async {
    print(CacheHelper.getData(key: StringsEn.token));
    http.Response response = await getApiService.get(
      path: "${ApiConsts.url}${ApiConsts.getProfileEndPoint}",
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
      },
    );
    print(response.body);
    return response;
  }
}
