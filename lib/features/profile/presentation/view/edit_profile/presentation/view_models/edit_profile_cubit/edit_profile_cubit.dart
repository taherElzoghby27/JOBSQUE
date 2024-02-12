// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/models/profile_model.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  ProfileRepo profileRepo;

  EditProfileCubit({required this.profileRepo}) : super(EditProfileInitial());

  //variables
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerBio = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerMobileNumber = TextEditingController();
  String codeCountry = "+20";

  //check fields is full or not
  checkFieldsFullOrNot() => controllerName.text.isNotEmpty &&
          controllerName.text.isNotEmpty &&
          controllerName.text.isNotEmpty &&
          controllerName.text.isNotEmpty
      ? true
      : false;

  //check phone number
  bool checkPhoneNumber() =>
      '+${controllerMobileNumber.text}'.startsWith(codeCountry) &&
              controllerMobileNumber.text.length > 10
          ? true
          : false;

//on changed counry
  onChangedCountry({required CountryCode code}) =>
      codeCountry = code.dialCode.toString();

  //save method
  save() async {
    if (checkFieldsFullOrNot() && checkPhoneNumber()) {
      try {
        emit(SavedLoading());
        //edit profile
        Either<FailureServ, ProfileModel> editProfileResult =
            await profileRepo.editProfile(
          profileModel: ProfileModel(
            bio: controllerBio.text,
            address: controllerAddress.text,
            mobile: controllerMobileNumber.text,
            interestedWork: CacheHelper.getData(
              key: StringsEn.whatTypeOfWorkInterestedKey,
            ),
            remotePlace: CacheHelper.getData(key: StringsEn.workLocationK),
            offlinePlace: CacheHelper.getData(key: StringsEn.workLocationK),
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
      } catch (error) {
        emit(SavedFailure(message: StringsEn.someThingError));
      }
    } else {
      emit(SavedFailure(message: StringsEn.someThingError));
    }
  }
}
