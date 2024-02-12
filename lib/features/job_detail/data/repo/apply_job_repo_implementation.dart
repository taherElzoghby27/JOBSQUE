import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/core/services/remote_datasource/apply_user_service/apply_user_service.dart';
import 'package:jobsque/features/job_detail/data/repo/apply_job_repo.dart';

class ApplyUserRepoImplementation extends ApplyUserRepo {
  ApplyUserService applyUserService;

  ApplyUserRepoImplementation({required this.applyUserService});

  @override
  Future<Either<FailureServ, ApplyUser>> applyJob({
    required ApplyUser applyUser,
  }) async {
    try {
      var response = await applyUserService.applyUser(applyUser: applyUser);
      ApplyUser applyJobModel = ApplyUser.fromJson(response["data"]);
      return Right(applyJobModel);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
