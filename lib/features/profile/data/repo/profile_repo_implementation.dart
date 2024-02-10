import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/profile_model.dart';
import 'package:jobsque/core/services/remote_datasource/auth_service/signout_service.dart';
import 'package:jobsque/features/auth/data/models/user_login/user.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo.dart';

import '../../../../core/consts/api_service.dart';
import '../../../../core/services/remote_datasource/profile_service/edit_profile_service.dart';

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
  Future<Either<Failure, User>> getProfile() async {
    try {
      Map<String, dynamic> result = await apiService.get(
        path: "${ApiConsts.getProfileEndPoint}",
      );

      User profileUser = User.fromJson(result["data"]);
      return Right(profileUser);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> editProfile({
    required ProfileModel profileModel,
  }) async {
    try {
      //response
      Map<String, dynamic> result = await editProfileService.editProfile(
        profileModel: profileModel,
      );
      ProfileModel model = ProfileModel.fromJson(result["data"]);
      return Right(model);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
