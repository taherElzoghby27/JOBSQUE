import 'package:dio/dio.dart';

import 'package:jobsque/features/auth/data/models/user_login/user.dart';
import 'package:jobsque/features/auth/data/models/user_login/user_login.dart';

import '../../../consts/api.dart';
import '../../../consts/api_service.dart';

class ResetPassApiService {
  ApiService apiService;

  ResetPassApiService({required this.apiService});

  //resetPassword method
  Future<Map<String, dynamic>> resetPasswordApi({required String email}) async {
    UserLogin user = UserLogin(user: User(email: email));
    Map<String, dynamic> response = await apiService.post(
      path: "${ApiConsts.resetPasswordEndPoint}",
      body: user.user!.toJson(),
    );

    return response;
  }
}
