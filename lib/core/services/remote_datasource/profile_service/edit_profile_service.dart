
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/models/profile_model.dart';

import '../../../consts/api_service.dart';

class EditProfileService {
  ApiService apiService;

  EditProfileService({required this.apiService});

  //edit profile method
  Future<Map<String, dynamic>> editProfile({
    required ProfileModel profileModel,
  }) async {
    Map<String, dynamic> response = await apiService.put(
      path: "${ApiConsts.editProfileEndPoint}",
      body: profileModel.toJson(),
    );

    return response;
  }
}
