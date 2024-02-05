import 'package:http/http.dart' as http;
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/services/api_service/api_service.dart';
import 'package:jobsque/features/complete_profile/data/models/experience_model.dart';


class EditProfileService {
  ApiService apiService;

  EditProfileService({required this.apiService});

  //edit profile method
  Future<http.Response> addExperience({
    required ExperienceModel experienceModel,
  }) async {
    http.Response response = await apiService.put(
      path: "${ApiConsts.experinceEndpoint}",
      body: experienceModel.toJson(),
      headers: {
        'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
      },
    );

    return response;
  }
}
