// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/src/response.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/core/services/api_service/apply_user_service/apply_user_service.dart';
import 'package:jobsque/features/auth/data/models/failure_message.dart';
import 'package:jobsque/features/job_detail/data/repo/apply_job_repo.dart';

class ApplyUserRepoImplementation extends ApplyUserRepo {
  ApplyUserService applyUserService;
  ApplyUserRepoImplementation({required this.applyUserService});
  @override
  Future<Either<FailureMessage, ApplyUser>> applyJob({
    required ApplyUser applyUser,
  }) async {
    try {
      Response response =
          await applyUserService.applyUser(applyUser: applyUser);
      print("${response.statusCode}\t\t:\t\t${response.body}");
      if (response.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(response.body);
        ApplyUser applyJobModel = ApplyUser.fromJson(result["data"]);
        return Right(applyJobModel);
      } else {
        return Left(FailureMessage(message: StringsEn.someThingError));
      }
    } catch (error) {
      return Left(FailureMessage(message: error.toString()));
    }
  }
}
