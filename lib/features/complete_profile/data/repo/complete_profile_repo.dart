import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/features/complete_profile/data/models/experience_model.dart';

abstract class CompleteProfileRepo {
  //add experience method
  Future<Either<FailureServ, ExperienceModel>> addExperience({
    required ExperienceModel experModel,
  });
}
