import 'package:dartz/dartz.dart';
import 'package:jobsque/core/models/user_data.dart';
import 'package:jobsque/features/auth/data/models/failure_message.dart';

abstract class ProfileRepo {
  //sign out
  Future<Either<FailureMessage, UserData>> getProfile();
  //sign out
  Future<bool> signOut();
}
