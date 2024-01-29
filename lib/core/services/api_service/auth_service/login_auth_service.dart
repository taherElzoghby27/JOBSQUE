import 'package:http/http.dart' as http;
import 'package:jobsque/core/services/api_service/service/post_api_service.dart';
import 'package:jobsque/features/auth/data/models/user_login/user.dart';
import 'package:jobsque/features/auth/data/models/user_login/user_login.dart';

import '../../../consts/api.dart';

class LoginApiService {
  PostApiService postApiService;

  LoginApiService({required this.postApiService});

  //login method
  Future<http.Response> loginApi({
    required String email,
    required String password,
  }) async {
    UserLogin user = UserLogin(
      user: User(email: email, password: password),
    );
    http.Response response = await postApiService.post(
      path: "${ApiConsts.url}${ApiConsts.loginEndPoint}",
      body: user.user!.toJson(),
    );

    return response;
  }
}
