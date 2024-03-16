import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/services/remote_datasource/auth_service/signout_service.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo.dart';

import '../../../../core/consts/api_service.dart';
import '../../../../core/models/user_profile_model/user_profile_portolio_model.dart';

class ProfileRepoImplementation extends ProfileRepo {
  final SignOutService signOutService;
  final ApiService apiService;

  ProfileRepoImplementation({
    required this.signOutService,
    required this.apiService,
  });

  @override
  Future<bool> signOut() async {
    return signOutService.signOut();
  }

  @override
  Future<Either<FailureServ, UserProfilePortfolioModel>> getProfile() async {
    try {
      Map<String, dynamic> result = await apiService.get(
        path: "${ApiConsts.getPortfolioEndPoint}",
      );

      UserProfilePortfolioModel profileUser =
          UserProfilePortfolioModel.fromJson(
        result["data"],
      );
      return Right(profileUser);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
