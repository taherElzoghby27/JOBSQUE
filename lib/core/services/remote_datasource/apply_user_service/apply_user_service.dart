import 'package:dio/dio.dart';
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';

import '../../../consts/api_service.dart';

class ApplyUserService {
  ApiService apiService;

  ApplyUserService({required this.apiService});

  //apply user to api
  Future<Map<String, dynamic>> applyUser({required ApplyUser applyUser}) async {
    String url = '${ApiConsts.applyEndPoint}';
    FormData formData = FormData.fromMap({
      'name': applyUser.name!,
      'email': applyUser.email!,
      'mobile': applyUser.phone!,
      'work_type': applyUser.typeOfWork!,
      'jobs_id': applyUser.jobId!,
      'user_id': applyUser.userId!,
      'cv_file': await MultipartFile.fromFile(applyUser.cv!.path,
          filename: applyUser.cv!.path.split('/').last),
      'other_file': await MultipartFile.fromFile(applyUser.otherFiles!.path,
          filename: applyUser.otherFiles!.path.split('/').last),
    });

    Map<String, dynamic> response =
        await apiService.post(path: url, body: formData);
    return response;
  }
}
