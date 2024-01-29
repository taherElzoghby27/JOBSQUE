import 'package:http/http.dart' as http;
import 'package:jobsque/core/services/api_service/service/post_api_service.dart';
import 'package:jobsque/features/auth/data/models/user_create/user_model.dart';

import '../../../../features/auth/data/models/user_create/data_model.dart';
import '../../../consts/api.dart';

class RegisterApiService {
  PostApiService postApiService;

  RegisterApiService({required this.postApiService});

  //register method
  Future<http.Response> registerApi({
    required String name,
    required String email,
    required String password,
  }) async {
    UserSignUp user = UserSignUp(
      data: Data(name: name, email: email, password: password),
    );
    http.Response response = await postApiService.post(
      path: "${ApiConsts.url}${ApiConsts.registerEndPoint}",
      body: user.data!.toJsonRigester(),
    );

    return response;
  }
}
