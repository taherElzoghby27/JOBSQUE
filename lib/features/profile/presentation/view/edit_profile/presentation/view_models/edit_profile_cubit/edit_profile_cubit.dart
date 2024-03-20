// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/models/profile_model.dart';
import 'package:jobsque/core/models/user_profile_model/user_profile_portolio_model.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/data/repo/edit_profile_repo.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileRepo editProfileRepo;
  ProfileRepo profileRepo;

  EditProfileCubit({
    required this.editProfileRepo,
    required this.profileRepo,
  }) : super(EditProfileInitial());
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  //variables
  TextEditingController controllerBio = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerMobileNumber = TextEditingController();
  String codeCountry = "+20";

//on changed country
  onChangedCountry({required CountryCode code}) =>
      codeCountry = code.dialCode.toString();

  //save method
  save() async {
    emit(SavedLoading());
    Either<FailureServ, UserProfilePortfolioModel> profile =
        await profileRepo.getProfile();
    profile.fold(
      (failure) {
        emit(SavedFailure(message: failure.message));
      },
      (success) async {
        await editProfile(success);
      },
    );
  }

//edit profile
  editProfile(UserProfilePortfolioModel success) async {
    Either<FailureServ, ProfileModel> editProfileResult =
        await editProfileRepo.editProfile(
      profileModel: ProfileModel(
        bio: controllerBio.text,
        address: controllerAddress.text,
        mobile: controllerMobileNumber.text,
        interestedWork: success.profile?.interestedWork ??
            CacheHelper.getData(
              key: StringsEn.whatTypeOfWorkInterestedKey,
            ),
        remotePlace: success.profile?.remotePlace ??
            CacheHelper.getData(key: StringsEn.workLocationK),
        offlinePlace: success.profile?.remotePlace ??
            CacheHelper.getData(key: StringsEn.workLocationK),
        education: success.profile!.education == null ||
                success.profile!.education!.isEmpty
            ? ''
            : success.profile!.education!,
        personalDetailed: '',
      ),
    );
    editProfileResult.fold(
      (failure) => emit(SavedFailure(message: failure.message)),
      (profile) async {
        await CacheHelper.saveData(
          key: StringsEn.personalDetailsCompleteK,
          value: true,
        );
        emit(SavedSuccess());
      },
    );
  }
}
