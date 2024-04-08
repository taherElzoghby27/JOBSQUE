import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/models/profile_model.dart';
import 'package:jobsque/core/models/user_profile_model/profile.dart';
import 'package:jobsque/core/models/user_profile_model/user_profile_portolio_model.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/data/repo/edit_profile_repo.dart';

import '../../../../../core/errors/failure_message.dart';

part 'add_education_state.dart';

class AddEducationCubit extends Cubit<AddEducationState> {
  EditProfileRepo editProfileRepo;
  ProfileRepo profileRepo;

  AddEducationCubit({
    required this.editProfileRepo,
    required this.profileRepo,
  }) : super(AddEducationInitial());

  //variables

  //university
  TextEditingController _university = TextEditingController();

  set university(TextEditingController university) {
    this._university = university;
  }

  TextEditingController get university => this._university;

//degree
  TextEditingController _degree = TextEditingController();

  set degree(TextEditingController degree) {
    this._degree = degree;
  }

  TextEditingController get degree => this._degree;

  //start year
  DateTime? _startYear;

  set startYear(DateTime? startYear) {
    this._startYear = startYear;
  }

  DateTime? get startYear => this._startYear;

  //end year
  DateTime? _endYear;

  set endYear(DateTime? endYear) {
    this._endYear = endYear;
  }

  DateTime? get endYear => this._endYear;

  //change start year
  changeDate({required DateTime date, required String status}) {
    if (status == StringsEn.startYear) {
      startYear = date;
    } else {
      endYear = date;
    }
    emit(ChangedDateState());
  }

  //check fields is full or not
  bool get checkFieldsFullOrNot => university.text.isNotEmpty &&
          degree.text.isNotEmpty &&
          startYear != null &&
          endYear != null
      ? true
      : false;

  //total education
  String get totalEducation =>
      "${university.text},${degree.text},$startYear,$endYear";

  //save method
  save() async {
    if (checkFieldsFullOrNot) {
      emit(AddedLoadingState());
      Either<FailureServ, UserProfilePortfolioModel> profile =
          await profileRepo.getProfile();
      profile.fold(
        (failure) {
          emit(AddedFailureState(message: failure.message));
        },
        (success) async {
          await editProfile(success);
        },
      );
    } else {
      emit(AddedFailureState(message: StringsEn.fieldsNotComplted));
    }
  }

//edit profile
  Future<void> editProfile(UserProfilePortfolioModel success) async {
    Profile? profile = success.profile;
    print(totalEducation);
    Either<FailureServ, ProfileModel> editProfileResult =
        await editProfileRepo.editProfile(
      profileModel: ProfileModel(
        bio: profile!.bio ?? '',
        address: profile.address ?? '',
        mobile: profile.mobile ?? '',
        interestedWork: profile.interestedWork!,
        remotePlace: profile.remotePlace!,
        offlinePlace: profile.remotePlace!,
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
        emit(AddedSuccessfullyState());
      },
    );
  }
}
