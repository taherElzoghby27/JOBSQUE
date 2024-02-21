import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/core/network_info/network_info.dart';
import 'package:jobsque/core/services/local_datasource/hive_db_apply_user.dart';
import 'package:jobsque/core/services/remote_datasource/apply_user_service/apply_user_service.dart';
import 'package:jobsque/features/job_detail/data/repo/apply_job_repo.dart';

class ApplyUserRepoImplementation extends ApplyUserRepo {
  ApplyUserService applyUserService;
  HiveDbApplyUser hiveDbApplyUser;
  NetworkInfo networkInfo;

  ApplyUserRepoImplementation({
    required this.applyUserService,
    required this.hiveDbApplyUser,
    required this.networkInfo,
  });

  @override
  Future<Either<FailureServ, ApplyUser>> applyJobRemote({
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

  @override
  Future<Either<String, String>> applyJobLocal({
    required ApplyUser applyUser,
  }) async {
    if (await networkInfo.isConnected) {
      await hiveDbApplyUser.add(user: applyUser);
      return Right(StringsEn.success);
    } else {
      return Left(StringsEn.noInternetConnection);
    }
  }
}
