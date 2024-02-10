
import 'package:jobsque/core/consts/api_service.dart';

import '../../../consts/api.dart';

class GetOtpService {
  ApiService apiService;

  GetOtpService({required this.apiService});

  //filter jobs method
  Future<Map<String, dynamic>> getOtp({
    required String email,
  }) async {
    Map<String, dynamic> response = await apiService.post(
      path: "${ApiConsts.getOtpEndPoint}",
      body: {'email': email},
    );

    return response;
  }
}
