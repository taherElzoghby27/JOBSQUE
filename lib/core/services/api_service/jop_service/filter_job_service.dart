import 'package:http/http.dart' as http;
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/services/api_service/post_api_service.dart';

import '../../../consts/api.dart';

class JobApiService {
  PostApiService postApiService;

  JobApiService({required this.postApiService});

  //filter jobs method
  Future<http.Response> FilterJobApi({
    required String name,
    required String location,
    required String salary,
  }) async {
    Job job = Job(name: name, location: location, salary: salary);
    http.Response response = await postApiService.post(
      path: "${ApiConsts.url}${ApiConsts.filterJobEndPoint}",
      body: job.toJson(),
      headers: {
        'Authorization': 'Bearer ${CacheHelper.getData(key: StringsEn.token)}',
      },
    );

    return response;
  }
}
