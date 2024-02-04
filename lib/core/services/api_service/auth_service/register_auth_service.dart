import 'package:http/http.dart' as http;
import 'package:jobsque/features/auth/data/models/user_create/user_model.dart';

import '../../../../features/auth/data/models/user_create/data_model.dart';
import '../../../consts/api.dart';
import '../api_service.dart';

class RegisterApiService {
  ApiService apiService;

  RegisterApiService({required this.apiService});

  //register method
  Future<http.Response> registerApi({
    required String name,
    required String email,
    required String password,
  }) async {
    UserSignUp user = UserSignUp(
      data: Data(name: name, email: email, password: password),
    );
    http.Response response = await apiService.post(
      path: "${ApiConsts.registerEndPoint}",
      body: user.data!.toJsonRigester(),
    );

    return response;
  }
}
