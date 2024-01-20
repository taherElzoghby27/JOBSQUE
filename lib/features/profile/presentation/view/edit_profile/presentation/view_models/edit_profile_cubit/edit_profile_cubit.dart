// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/models/profile_model.dart';
import 'package:jobsque/features/auth/data/models/failure_message.dart';

import 'package:jobsque/features/auth/data/repos/auth_repo.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  AuthRepo authRepo;
  EditProfileCubit({required this.authRepo}) : super(EditProfileInitial());
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
  save(BuildContext context) async {
    if (checkFieldsFullOrNot() && checkPhoneNumber()) {
      try {
        emit(SavedLoading());
        //save name to shared prefernce
        await CacheHelper.saveData(
          key: StringsEn.name,
          value: controllerName.text,
        );
        //edit profile
        Either<FailureMessage, ProfileModel> editProfileResult =
            await authRepo.editProfile(
          profileModel: ProfileModel(
            bio: controllerBio.text,
            address: controllerAddress.text,
            mobile: controllerMobileNumber.text,
          ),
        );
        editProfileResult.fold(
          (failure) => emit(SavedFailure()),
          (profile) {
            emit(SavedSuccess());
            GoRouter.of(context).pop();
          },
        );
      } catch (error) {
        emit(SavedFailure());
      }
    } else {
      emit(SavedFailure());
    }
    return false;
  }
}
