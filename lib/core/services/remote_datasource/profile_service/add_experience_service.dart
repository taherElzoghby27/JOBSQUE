
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/consts/api_service.dart';
import 'package:jobsque/features/complete_profile/data/models/experience_model.dart';

class AddExperienceService {
  ApiService apiService;

  AddExperienceService({required this.apiService});

  //edit profile method
  Future<Map<String, dynamic>> addExperience({
    required ExperienceModel experienceModel,
  }) async {
    Map<String, dynamic> response = await apiService.post(
      path: "${ApiConsts.experinceEndpoint}",
      body: experienceModel.toJson(),
    );

    return response;
  }
}
