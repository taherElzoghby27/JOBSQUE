import 'package:http/http.dart' as http;
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/models/profile_model.dart';
import 'package:jobsque/core/services/api_service/post_api_service.dart';

class EditProfileService {
  PostApiService postApiService;

  EditProfileService({required this.postApiService});

  //edit profile method
  Future<http.Response> editProfile(
      {required ProfileModel profileModel}) async {
    http.Response response = await postApiService.post(
      path: "${ApiConsts.url}${ApiConsts.editProfileEndPoint}",
      body: profileModel.toJson(),
      headers: {
        'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
      },
    );
    print(response);

    return response;
  }
}
