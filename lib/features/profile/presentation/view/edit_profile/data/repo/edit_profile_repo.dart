import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/profile_model.dart';

abstract class EditProfileRepo {
  //edit profile
  Future<Either<FailureServ, ProfileModel>> editProfile({
    required ProfileModel profileModel,
  });
}
