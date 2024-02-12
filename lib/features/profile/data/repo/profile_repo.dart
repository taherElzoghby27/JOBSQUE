import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/profile_model.dart';
import 'package:jobsque/features/auth/data/models/user_login/user.dart';

abstract class ProfileRepo {
  //sign out
  Future<Either<FailureServ, User>> getProfile();
  //sign out
  Future<bool> signOut();
  //edit profile
  Future<Either<FailureServ, ProfileModel>> editProfile({
    required ProfileModel profileModel,
  });
}
