import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/profile_model.dart';
import 'package:jobsque/core/services/remote_datasource/profile_service/edit_profile_service.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/data/repo/edit_profile_repo.dart';

class EditProfileRepoImpl extends EditProfileRepo {
  final EditProfileService editProfileService;

  EditProfileRepoImpl({
    required this.editProfileService,
  });

  @override
  Future<Either<FailureServ, ProfileModel>> editProfile({
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
