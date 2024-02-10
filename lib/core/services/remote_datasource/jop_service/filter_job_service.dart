
import 'package:jobsque/core/models/job_model/job_model.dart';

import '../../../consts/api.dart';
import '../../../consts/api_service.dart';

class JobApiService {
  ApiService apiService;

  JobApiService({required this.apiService});

  //filter jobs method
  Future<Map<String, dynamic>> FilterJobApi({
    required String name,
    required String location,
    required String salary,
  }) async {
    Job job = Job(name: name, location: location, salary: salary);
    Map<String, dynamic> response = await apiService.post(
      path: "${ApiConsts.filterJobEndPoint}",
      body: job.toJson(),
    );

    return response;
  }
}
