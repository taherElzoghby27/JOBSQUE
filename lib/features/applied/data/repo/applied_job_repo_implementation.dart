import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/core/services/api_service/api_service.dart';
import 'package:jobsque/core/services/local_database/hive_db_apply_user.dart';
import 'package:jobsque/features/applied/data/repo/applied_job_repo.dart';

import '../../../../core/consts/api.dart';

class AppliedJobsRepoImplementation extends AppliedJobRepo {
  HiveDbApplyUser hiveDbApplyUser;
  ApiService apiService;

  AppliedJobsRepoImplementation({
    required this.hiveDbApplyUser,
    required this.apiService,
  });

  @override
  Future<List<ApplyUser>> getJobsAppliedLocal({
    required String userId,
  }) async {
    List<ApplyUser> appliedJobs = await hiveDbApplyUser.get();
    print(appliedJobs);
    return appliedJobs;
  }

  @override
  Future<Either<FailureMessage, List<ApplyUser>>> getJobsAppliedRemote({
    required String userId,
  }) async {
    try {
      //response
      http.Response result = await apiService.get(
        path: '${ApiConsts.applyEndPoint}/$userId',
      );
      //convert data from json to map
      Map<String, dynamic> data = jsonDecode(result.body);
      //success
      if (result.statusCode == 200) {
        print('success');
        //convert data from List<map> to List<ApplyUser>
        List<dynamic> jobsData = data['data'];
        List<ApplyUser> applyJobs = jobsData
            .map(
              (job) => ApplyUser.fromJson(job),
            )
            .toList();
        print(applyJobs);
        return Right(applyJobs);
      } else if (result.statusCode == 401) {
        //failure
        return Left(FailureMessage(message: result.body.toString()));
      }
    } catch (e) {
      //failure
      return Left(FailureMessage(message: e.toString()));
    }
    return Left(FailureMessage(message: StringsEn.someThingError));
  }
}
