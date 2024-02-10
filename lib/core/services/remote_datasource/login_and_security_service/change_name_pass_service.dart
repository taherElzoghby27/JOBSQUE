
import 'package:jobsque/core/consts/api_service.dart';

import '../../../consts/api.dart';

class UpdateNamePassService {
  ApiService apiService;

  UpdateNamePassService({required this.apiService});

  //filter jobs method
  Future<Map<String, dynamic>> updateData({
    required String name,
    required String password,
  }) async {
    Map<String, dynamic> response = await apiService.post(
      path: "${ApiConsts.updateNamePassEndPoint}",
      body: {
        'name': name,
        'password': password,
      },
    );

    return response;
  }
}
