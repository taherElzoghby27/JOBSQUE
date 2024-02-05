import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/features/applied/presentation/view_models/applied_job_cubit/applied_job_cubit.dart';
import 'package:jobsque/features/complete_profile/data/models/experience_model.dart';

abstract class CompleteProfileRepo {
  //add experience method
  Future<Either<FailureMessage, ExperienceModel>> addExperience({
    required ExperienceModel experienceModel,
  });
}
