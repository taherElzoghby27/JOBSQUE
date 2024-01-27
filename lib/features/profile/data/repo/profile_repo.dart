import 'package:dartz/dartz.dart';
import 'package:jobsque/core/models/user_profile_model/user_profile_portolio_model.dart';
import 'package:jobsque/features/auth/data/models/failure_message.dart';

abstract class ProfileRepo {
  //sign out
  Future<Either<FailureMessage, UserProfilePortfolioModel>> getProfile();
  //sign out
  Future<bool> signOut();
}
