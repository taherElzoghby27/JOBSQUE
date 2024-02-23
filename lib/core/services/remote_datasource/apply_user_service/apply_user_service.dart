import 'package:dio/dio.dart';
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/consts/api_service.dart';

import '../../../models/apply_user_model/apply_user_model.dart';

class ApplyUserService {
  ApiService apiService;

  ApplyUserService({required this.apiService});

  //apply user to api
  Future<Map<String, dynamic>> applyUser({required ApplyUser applyUser}) async {
    String url = '${ApiConsts.applyEndPoint}';
    FormData data = await applyUser.toMap();
    Map<String, dynamic> response = await apiService.post(
      path: url,
      body: data,
    );
    return response;
  }
}
