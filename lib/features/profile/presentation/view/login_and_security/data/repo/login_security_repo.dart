import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failure_message.dart';

abstract class LoginAndSecurityRepo {
  //get otp
  Future<Either<FailureMessage, String>> getOtp({required String email});

  //change name & pass
  Future<Either<FailureMessage, String>> changeNamePass({
    required String name,
    required String password,
  });
}
