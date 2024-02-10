

import 'package:jobsque/features/auth/data/models/user_login/user.dart';
import 'package:jobsque/features/auth/data/models/user_login/user_login.dart';

import '../../../consts/api.dart';
import '../../../consts/api_service.dart';

class LoginApiService {
  ApiService apiService;

  LoginApiService({required this.apiService});

  //login method
   Future<Map<String, dynamic>> loginApi({
    required String email,
    required String password,
  }) async {
    UserLogin user = UserLogin(
      user: User(email: email, password: password),
    );
    Map<String, dynamic> response = await apiService.post(
      path: "${ApiConsts.loginEndPoint}",
      body: user.user!.toJson(),
    );

    return response;
  }
}
