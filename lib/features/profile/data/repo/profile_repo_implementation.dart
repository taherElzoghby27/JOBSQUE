// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/models/profile_model.dart';
import 'package:jobsque/core/services/api_service/api_service.dart';
import 'package:jobsque/core/services/api_service/auth_service/signout_service.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/services/api_service/profile_service/edit_profile_service.dart';
import 'package:jobsque/features/auth/data/models/user_login/user.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo.dart';

class ProfileRepoImplementation extends ProfileRepo {
  final SignOutService signOutService;
  final ApiService apiService;
  final EditProfileService editProfileService;

  ProfileRepoImplementation({
    required this.signOutService,
    required this.apiService,
    required this.editProfileService,
  });

  @override
  Future<bool> signOut() async {
    return signOutService.signOut();
  }

  @override
  Future<Either<FailureMessage, User>> getProfile() async {
    try {
      http.Response result = await apiService.get(
        path: "${ApiConsts.getProfileEndPoint}",
      );
      Map<String, dynamic> data = jsonDecode(result.body);

      if (result.statusCode == 200) {
        print("success");
        //success
        User profileUser = User.fromJson(data["data"]);
        return Right(profileUser);
      } else {
        //fail
        FailureMessage failModel = FailureMessage.fromJson(data);
        return Left(failModel);
      }
    } catch (error) {
      print("fail2");
      return Left(FailureMessage(message: error.toString()));
    }
  }

  @override
  Future<Either<FailureMessage, ProfileModel>> editProfile({
    required ProfileModel profileModel,
  }) async {
    try {
      //response
      http.Response result = await editProfileService.editProfile(
        profileModel: profileModel,
      );
      Map<String, dynamic> data = jsonDecode(result.body);
      //success
      if (result.statusCode == 200) {
        ProfileModel model = ProfileModel.fromJson(data["data"]);
        return Right(model);
      } else if (result.statusCode == 401) {
        return Left(FailureMessage.fromJson(data));
      }
    } catch (e) {
      //failure
      return Left(FailureMessage(message: e.toString()));
    }
    return Left(FailureMessage(message: StringsEn.someThingError));
  }
}
