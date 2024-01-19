import 'package:dartz/dartz.dart';
import 'package:jobsque/core/models/profile_model.dart';
import 'package:jobsque/features/auth/data/models/failure_message.dart';
import 'package:jobsque/features/auth/data/models/user_login/user_login.dart';

import '../models/user_create/user_model.dart';

abstract class AuthRepo {
  //create account
  Future<Either<FailureMessage, UserSignUp>> register({
    required String name,
    required String email,
    required String password,
  });

  //login with account
  Future<Either<FailureMessage, UserLogin>> login({
    required String email,
    required String password,
  });

  //reset password with email address
  Future<Either<FailureMessage, String>> resetPassword({required String email});
  //edit profile
  Future<Either<FailureMessage, ProfileModel>> editProfile({
    required String interestedInWork,
    required String workLocation,
  });
}
