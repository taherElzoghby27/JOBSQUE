import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/src/response.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/services/api_service/profile_service/add_experience_service.dart';
import 'package:jobsque/features/complete_profile/data/models/experience_model.dart';
import 'package:jobsque/features/complete_profile/data/repo/complete_profile_repo.dart';

class CompleteProfileRepoImpl extends CompleteProfileRepo {
  final AddExperienceService _addExperienceService;

  CompleteProfileRepoImpl({required AddExperienceService addExperienceService})
      : _addExperienceService = addExperienceService;

  @override
  Future<Either<FailureMessage, ExperienceModel>> addExperience(
      {required ExperienceModel experienceModel}) async {
    late Response response;
    try {
      response = await _addExperienceService.addExperience(
        experienceModel: experienceModel,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        ExperienceModel experienceModel = ExperienceModel.fromJson(
          data['data'],
        );
        return Right(experienceModel);
      }
    } on SocketException {
      return Left(
        FailureMessage(message: 'No Internet connection'),
      );
    } on TimeoutException catch (e) {
      return Left(
        FailureMessage(message: 'Connection timeout'),
      );
    } on Error catch (e) {
      return Left(FailureMessage.fromHttpError(response));
    }
    return Left(
      FailureMessage(message: StringsEn.someThingError),
    );
  }
}
