
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/services/remote_datasource/auth_service/register_auth_service.dart';
import 'package:jobsque/features/auth/data/models/user_create/user_model.dart';
import 'package:jobsque/features/auth/data/models/user_login/user_login.dart';
import 'package:jobsque/features/auth/data/repos/auth_repo.dart';

import '../../../../core/services/remote_datasource/auth_service/login_auth_service.dart';
import '../../../../core/services/remote_datasource/auth_service/reset_pass_auth_service.dart';

class AuthRepoImplementation implements AuthRepo {
  final RegisterApiService registerApiService;
  final LoginApiService loginApiService;
  final ResetPassApiService resetPassApiService;

  AuthRepoImplementation({
    required this.registerApiService,
    required this.loginApiService,
    required this.resetPassApiService,
  });

  @override
  Future<Either<FailureServ, UserSignUp>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      //response
      Map<String, dynamic> result = await registerApiService.registerApi(
        name: name,
        email: email,
        password: password,
      );
      UserSignUp userInfo = UserSignUp.fromJson(result);
      return Right(userInfo);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<FailureServ, UserLogin>> login({
    required String email,
    required String password,
  }) async {
    try {
      //response
      Map<String, dynamic> result = await loginApiService.loginApi(
        email: email,
        password: password,
      );
      //success
      UserLogin user = UserLogin.fromJson(result);
      return Right(user);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<FailureServ, String>> resetPassword({
    required String email,
  }) async {
    try {
      //response
      Map<String, dynamic> result = await resetPassApiService.resetPasswordApi(
        email: email,
      );
      String status = result['status'] as String;
      print(status);
      return Right(status);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
