import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/models/profile_model.dart';
import 'package:jobsque/core/models/user_profile_model/user_profile_portolio_model.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/data/repo/edit_profile_repo.dart';
import '../../../../../core/errors/failure_message.dart';
import '../../../../../service_locator.dart';

part 'add_education_state.dart';

class AddEducationCubit extends Cubit<AddEducationState> {
  EditProfileRepo editProfileRepo;
  ProfileRepo profileRepo;

  AddEducationCubit({
    required this.editProfileRepo,
    required this.profileRepo,
  }) : super(AddEducationInitial());

  //variables
  TextEditingController university = TextEditingController();
  TextEditingController title = TextEditingController();
  DateTime? startYear;
  DateTime? endYear;

  //change start year
  changeDate({required DateTime date, required String status}) {
    if (status == StringsEn.startYear) {
      startYear = date;
    } else {
      endYear = date;
    }
    emit(ChangedDateState());
  }

  //change end year

  //check fields is full or not
  bool get checkFieldsFullOrNot => university.text.isNotEmpty &&
          title.text.isNotEmpty &&
          startYear != null &&
          endYear != null
      ? true
      : false;

  //total education
  String get totalEducation => "$university,$title,$startYear,$endYear";

  //save method
  save() async {
    if (checkFieldsFullOrNot) {
      emit(AddedLoadingState());
      UserProfilePortfolioModel profile =
          getIt.get<UserProfilePortfolioModel>();
      //edit profile
      Either<FailureServ, ProfileModel> editProfileResult =
          await editProfileRepo.editProfile(
        profileModel: ProfileModel(
          bio: profile.profile!.bio ?? '',
          address: profile.profile!.address ?? '',
          mobile: profile.profile!.mobile ?? '',
          interestedWork: profile.profile!.interestedWork!,
          remotePlace: profile.profile!.remotePlace!,
          offlinePlace: profile.profile!.remotePlace!,
          education: totalEducation,
          personalDetailed: '',
        ),
      );
      editProfileResult.fold(
        (failure) => emit(AddedFailureState(message: failure.message)),
        (profile) async {
          await CacheHelper.saveData(
            key: StringsEn.educationCompleteK,
            value: true,
          );
          await profileRepo.getProfile();
          emit(AddedSuccessfullyState());
        },
      );
    } else {
      emit(AddedFailureState(message: StringsEn.fieldsNotComplted));
    }
  }
}
