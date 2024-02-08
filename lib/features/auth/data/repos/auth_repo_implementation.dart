import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/core/services/api_service/auth_service/reset_pass_auth_service.dart';
import 'package:jobsque/features/auth/data/models/user_create/user_model.dart';
import 'package:jobsque/features/auth/data/models/user_login/user_login.dart';
import 'package:jobsque/features/auth/data/repos/auth_repo.dart';

import '../../../../core/services/api_service/auth_service/login_auth_service.dart';
import '../../../../core/services/api_service/auth_service/register_auth_service.dart';
import '../../../../core/errors/failure_message.dart';

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
  Future<Either<FailureMessage, UserSignUp>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      //response
      http.Response result = await registerApiService.registerApi(
        name: name,
        email: email,
        password: password,
      );
      Map<String, dynamic> data = jsonDecode(result.body);
      //success
      if (result.statusCode == 200) {
        UserSignUp userInfo = UserSignUp.fromJson(data);
        return Right(userInfo);
      } else if (result.statusCode == 401) {
        //failure
        return Left(FailureMessage.fromJson(data));
      }
    } catch (e) {
      //failure
      return Left(FailureMessage(message: e.toString()));
    }
    return Left(FailureMessage(message: 'something error'));
  }

  @override
  Future<Either<FailureMessage, UserLogin>> login({
    required String email,
    required String password,
  }) async {
    try {
      //response
      http.Response result = await loginApiService.loginApi(
        email: email,
        password: password,
      );
      Map<String, dynamic> data = jsonDecode(result.body);
      //success
      if (result.statusCode == 200) {
        UserLogin user = UserLogin.fromJson(data);
        return Right(user);
      } else if (result.statusCode == 401) {
        //failure
        print(data);
        return Left(FailureMessage.fromJson(data));
      }
    } catch (e) {
      //failure
      return Left(FailureMessage(message: 'wrong password'));
    }
    return Left(FailureMessage(message: 'something error'));
  }

  @override
  Future<Either<FailureMessage, String>> resetPassword({
    required String email,
  }) async {
    try {
      //response
      http.Response result = await resetPassApiService.resetPasswordApi(
        email: email,
      );
      Map<String, dynamic> data = jsonDecode(result.body);
      String status = data['status'] as String;
      //success
      if (result.statusCode == 200) {
        print(status);
        return Right(status);
      } else if (result.statusCode == 401) {
        //failure
        print(status);
        return Left(FailureMessage.fromJson(data));
      }
    } catch (e) {
      //failure
      return Left(FailureMessage(message: e.toString()));
    }
    return Left(FailureMessage(message: 'something error'));
  }

}
