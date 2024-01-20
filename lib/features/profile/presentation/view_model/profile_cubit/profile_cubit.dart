// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jobsque/core/models/user_data.dart';

import 'package:jobsque/features/auth/data/models/failure_message.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo.dart';

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
    Either<FailureMessage, UserData> profile = await profileRepo.getProfile();
    profile.fold(
      (failure) {
        print("fail");
        emit(GetProfileFailure(message: failure.message!));
      },
      (userProfile) {
        print("----name--${userProfile.name}");
        emit(GetProfileSuccess(userProfileModel: userProfile));
      },
    );
  }
}
