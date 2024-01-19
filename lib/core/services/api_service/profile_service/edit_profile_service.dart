import 'package:http/http.dart' as http;
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/models/profile_model.dart';
import 'package:jobsque/core/services/api_service/put_api_service.dart';

class EditProfileService {
  PutApiService putApiService;

  EditProfileService({required this.putApiService});

  //edit profile method
  Future<http.Response> editProfile({
    required ProfileModel profileModel,
  }) async {
    http.Response response = await putApiService.put(
      path: "${ApiConsts.url}${ApiConsts.editProfileEndPoint}",
      body: profileModel.toJson(),
      headers: {
        'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
      },
    );

    return response;
  }
}
