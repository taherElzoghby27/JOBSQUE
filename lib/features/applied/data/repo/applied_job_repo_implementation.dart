import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/features/applied/data/repo/applied_job_repo.dart';

import '../../../../core/consts/api.dart';
import '../../../../core/consts/api_service.dart';
import '../../../../core/services/local_datasource/hive_db_apply_user.dart';

class AppliedJobsRepoImplementation extends AppliedJobRepo {
  HiveDbApplyUser hiveDbApplyUser;
  ApiService apiService;

  AppliedJobsRepoImplementation({
    required this.hiveDbApplyUser,
    required this.apiService,
  });

  @override
  Future<List<ApplyUser>> getJobsAppliedLocal() async {
    List<ApplyUser> appliedJobs = await hiveDbApplyUser.get();
    return appliedJobs;
  }

  @override
  Future<Either<FailureServ, List<ApplyUser>>> getJobsAppliedRemote({
    required String userId,
  }) async {
    try {
      //response
      Map<String, dynamic> result = await apiService.get(
        path: '${ApiConsts.applyEndPoint}/$userId',
      );
      print('success');
      //convert data from List<map> to List<ApplyUser>
      List<dynamic> jobsData = result['data'];
      List<ApplyUser> applyJobs = jobsData
          .map(
            (job) => ApplyUser.fromJson(job),
          )
          .toList();
      print(applyJobs);
      return Right(applyJobs);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
