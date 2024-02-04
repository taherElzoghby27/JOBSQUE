import 'package:http/http.dart' as http;
import 'package:jobsque/core/services/api_service/api_service.dart';
import 'package:jobsque/features/auth/data/models/user_login/user.dart';
import 'package:jobsque/features/auth/data/models/user_login/user_login.dart';

import '../../../consts/api.dart';

class LoginApiService {
  ApiService apiService;

  LoginApiService({required this.apiService});

  //login method
  Future<http.Response> loginApi({
    required String email,
    required String password,
  }) async {
    UserLogin user = UserLogin(
      user: User(email: email, password: password),
    );
    http.Response response = await apiService.post(
      path: "${ApiConsts.loginEndPoint}",
      body: user.user!.toJson(),
    );

    return response;
  }
}
