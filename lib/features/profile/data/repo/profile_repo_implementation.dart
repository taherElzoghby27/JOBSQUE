// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/src/response.dart';

import 'package:jobsque/core/models/user_profile_model/user_profile_model.dart';
import 'package:jobsque/core/services/api_service/auth_service/signout_service.dart';
import 'package:jobsque/core/services/api_service/profile_service/get_profile_service.dart';
import 'package:jobsque/features/auth/data/models/failure_message.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo.dart';

class ProfileRepoImplementation extends ProfileRepo {
  SignOutService signOutService;
  GetProfileService getProfileService;
  ProfileRepoImplementation({
    required this.signOutService,
    required this.getProfileService,
  });
  @override
  Future<bool> signOut() async {
    return signOutService.signOut();
  }

  @override
  Future<Either<FailureMessage, UserProfileModel>> getProfile() async {
    try {
      Response result = await getProfileService.getProfile();
      final data = jsonDecode(result.body);

      if (result.statusCode == 200) {
        //success
        UserProfileModel profileUser = UserProfileModel.fromJson(data["data"]);
        return Right(profileUser);
      } else {
        //fail
        FailureMessage failModel = FailureMessage.fromJson(data);
        return Left(failModel);
      }
    } catch (error) {
      return Left(FailureMessage(message: error.toString()));
    }
  }
}
