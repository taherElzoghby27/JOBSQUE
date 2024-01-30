import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/services/api_service/login_and_security_service/change_name_pass_service.dart';
import 'package:jobsque/core/services/api_service/login_and_security_service/get_otp_service.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/data/repo/login_security_repo.dart';

import '../models/user_model_updated.dart';

class LoginAndSecurityRepoImplementation extends LoginAndSecurityRepo {
  UpdateNamePassService updateNamePassService;
  GetOtpService getOtpService;

  LoginAndSecurityRepoImplementation({
    required this.getOtpService,
    required this.updateNamePassService,
  });

  @override
  Future<Either<FailureMessage, UserModelUpdated>> updateNamePass({
    required String name,
    required String password,
  }) async {
    try {
      //response
      http.Response result = await updateNamePassService.updateData(
        name: name,
        password: password,
      );
      Map<String, dynamic> data = jsonDecode(result.body);
      //success
      if (result.statusCode == 200) {
        UserModelUpdated userInfo = UserModelUpdated.fromJson(data['data']);
        return Right(userInfo);
      } else if (result.statusCode == 401) {
        //failure
        return Left(FailureMessage.fromJson(data));
      }
    } catch (e) {
      //failure
      return Left(FailureMessage(message: e.toString()));
    }
    return Left(FailureMessage(message: StringsEn.someThingError));
  }

  @override
  Future<Either<FailureMessage, String>> getOtp({
    required String email,
  }) async {
    try {
      //response
      http.Response result = await getOtpService.getOtp(email: email);
      Map<String, dynamic> data = jsonDecode(result.body);
      //success
      if (result.statusCode == 200) {
        print('success');
        return Right(data['data']);
      } else if (result.statusCode == 401) {
        print('fail1');
        //failure
        return Left(FailureMessage.fromJson(data['message']));
      }
    } catch (e) {
      print('fail2');
      //failure
      return Left(FailureMessage(message: e.toString()));
    }
    return Left(FailureMessage(message: StringsEn.someThingError));
  }
}
