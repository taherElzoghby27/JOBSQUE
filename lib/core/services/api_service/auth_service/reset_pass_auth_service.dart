import 'package:http/http.dart' as http;
import 'package:jobsque/core/services/api_service/api_service.dart';
import 'package:jobsque/features/auth/data/models/user_login/user.dart';
import 'package:jobsque/features/auth/data/models/user_login/user_login.dart';

import '../../../consts/api.dart';

class ResetPassApiService {
  ApiService apiService;

  ResetPassApiService({required this.apiService});

  //resetPassword method
  Future<http.Response> resetPasswordApi({required String email}) async {
    UserLogin user = UserLogin(user: User(email: email));
    http.Response response = await apiService.post(
      path: "${ApiConsts.resetPasswordEndPoint}",
      body: user.user!.toJson(),
    );

    return response;
  }
}
