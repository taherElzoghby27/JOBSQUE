import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/features/auth/data/models/user_login/user_login.dart';

import '../models/user_create/user_model.dart';

abstract class AuthRepo {
  //create account
  Future<Either<FailureServ, UserSignUp>> register({
    required String name,
    required String email,
    required String password,
  });

  //login with account
  Future<Either<FailureServ, UserLogin>> login({
    required String email,
    required String password,
  });

  //reset password with email address
  Future<Either<FailureServ, String>> resetPassword({required String email});

}
