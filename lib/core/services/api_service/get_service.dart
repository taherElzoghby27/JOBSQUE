// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/core/services/api_service/service/get_api_service.dart';

class GetService {
  GetApiService getApiService;
  GetService({required this.getApiService});
  //get profile method
  Future<http.Response> getService({required String urlPath}) async {
    print(CacheHelper.getData(key: StringsEn.token));
    http.Response response = await getApiService.get(
      path: urlPath,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
      },
    );
    print(response.body);
    return response;
  }
}
