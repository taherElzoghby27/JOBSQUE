import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/features/complete_profile/data/models/experience_model.dart';
import 'package:jobsque/features/complete_profile/data/repo/complete_profile_repo.dart';

import '../../../../core/services/remote_datasource/profile_service/add_experience_service.dart';

class CompleteProfileRepoImpl extends CompleteProfileRepo {
  final AddExperienceService _addExperienceService;

  CompleteProfileRepoImpl({required AddExperienceService addExperienceService})
      : _addExperienceService = addExperienceService;

  @override
  Future<Either<Failure, ExperienceModel>> addExperience({
    required ExperienceModel experModel,
  }) async {
    try {
      Map<String, dynamic> response = await _addExperienceService.addExperience(
        experienceModel: experModel,
      );
      ExperienceModel experienceModel = ExperienceModel.fromJson(
        response['data'],
      );
      return Right(experienceModel);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
