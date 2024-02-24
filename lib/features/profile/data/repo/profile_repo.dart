import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/profile_model.dart';

import '../../../../core/models/user_profile_model/user_profile_portolio_model.dart';

abstract class ProfileRepo {
  //sign out
  Future<Either<FailureServ, UserProfilePortfolioModel>> getProfile();
  //sign out
  Future<bool> signOut();
  //edit profile
  Future<Either<FailureServ, ProfileModel>> editProfile({
    required ProfileModel profileModel,
  });
}
