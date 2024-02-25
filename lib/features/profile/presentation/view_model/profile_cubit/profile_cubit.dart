// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/user_profile_model/user_profile_portolio_model.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo.dart';
import 'package:jobsque/service_locator.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  //signout
  Future<bool> signOut() async {
    emit(SignOutLoading());
    bool isSignOut = await profileRepo.signOut();
    if (isSignOut) {
      emit(SignOutSucess());
    } else {
      emit(SignOutFailure());
    }
    return isSignOut;
  }

  //get profile
  getProfile() async {
    emit(GetProfileLoading());
    Either<FailureServ, UserProfilePortfolioModel> profile =
        await profileRepo.getProfile();
    profile.fold(
      (failure) {
        emit(GetProfileFailure(message: failure.message));
      },
      (userProfile) {
        saveDataInServiceLocator(userProfile);
        //emit success
        emit(GetProfileSuccess(userProfileModel: userProfile));
      },
    );
  }

  void saveDataInServiceLocator(UserProfilePortfolioModel userProfile) {
    //unregister model
    getIt.unregister<UserProfilePortfolioModel>();
    //save model in service locator
    getIt.registerSingleton<UserProfilePortfolioModel>(
      UserProfilePortfolioModel(
        portfolio: userProfile.portfolio,
        profile: userProfile.profile,
      ),
    );
  }
}
