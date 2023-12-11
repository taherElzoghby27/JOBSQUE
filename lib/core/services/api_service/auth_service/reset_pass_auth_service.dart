import 'package:http/http.dart' as http;
import 'package:jobsque/core/services/api_service/post_api_service.dart';
import 'package:jobsque/features/auth/data/models/user_login/user.dart';
import 'package:jobsque/features/auth/data/models/user_login/user_login.dart';

import '../../../consts/api.dart';

class ResetPassApiService {
  PostApiService postApiService;

  ResetPassApiService({required this.postApiService});

  //resetPassword method
  Future<http.Response> resetPasswordApi({required String email}) async {
    UserLogin user = UserLogin(user: User(email: email));
    http.Response response = await postApiService.post(
      path: "${ApiConsts.url}${ApiConsts.resetPasswordEndPoint}",
      body: user.user!.toJson(),
    );

    return response;
  }
}
