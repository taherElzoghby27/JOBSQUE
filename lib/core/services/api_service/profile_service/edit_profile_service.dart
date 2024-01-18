import 'package:http/http.dart' as http;
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/services/api_service/post_api_service.dart';

class EditProfileService {
  PostApiService postApiService;

  EditProfileService({required this.postApiService});

  //edit profile method
  Future<http.Response> editProfile({
    required String name,
    required String location,
    required String salary,
  }) async {
    http.Response response = await postApiService.post(
      path: "${ApiConsts.url}${ApiConsts.editProfileEndPoint}",
      body: {},
      headers: {
        'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
      },
    );

    return response;
  }
}
