import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failure_message.dart';

import '../../../../core/models/user_profile_model/user_profile_portolio_model.dart';

abstract class ProfileRepo {
  //sign out
  Future<Either<FailureServ, UserProfilePortfolioModel>> getProfile();
  //sign out
  Future<bool> signOut();
}
