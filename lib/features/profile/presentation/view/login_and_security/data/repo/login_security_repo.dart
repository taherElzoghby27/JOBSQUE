import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/data/models/user_model_updated.dart';

abstract class LoginAndSecurityRepo {
  //get otp
  Future<Either<FailureServ, String>> getOtp({required String email});

  //update name & pass
  Future<Either<FailureServ, UserModelUpdated>> updateNamePass({
    required String name,
    required String password,
  });
}
