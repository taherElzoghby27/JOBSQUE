import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/services/remote_datasource/login_and_security_service/change_name_pass_service.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/data/repo/login_security_repo.dart';

import '../../../../../../../core/services/remote_datasource/login_and_security_service/get_otp_service.dart';
import '../models/user_model_updated.dart';

class LoginAndSecurityRepoImplementation extends LoginAndSecurityRepo {
  UpdateNamePassService updateNamePassService;
  GetOtpService getOtpService;

  LoginAndSecurityRepoImplementation({
    required this.getOtpService,
    required this.updateNamePassService,
  });

  @override
  Future<Either<FailureServ, UserModelUpdated>> updateNamePass({
    required String name,
    required String password,
  }) async {
    try {
      //response
      Map<String, dynamic> result = await updateNamePassService.updateData(
        name: name,
        password: password,
      );
      UserModelUpdated userInfo = UserModelUpdated.fromJson(result['data']);
      return Right(userInfo);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<FailureServ, String>> getOtp({
    required String email,
  }) async {
    try {
      //response
      Map<String, dynamic> result = await getOtpService.getOtp(email: email);
      return Right(result['data']);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
