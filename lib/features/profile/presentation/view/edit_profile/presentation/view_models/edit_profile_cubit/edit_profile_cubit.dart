// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
      '+${controllerMobileNumber.text}'.startsWith(codeCountry) ? true : false;

//on changed counry
  onChangedCountry({required CountryCode code}) =>
      codeCountry = code.dialCode.toString();
  //save method
  Future<bool> save() async {
    emit(SavedLoading());
    if (checkFieldsFullOrNot() && checkPhoneNumber()) {
      emit(SavedSuccess());
      return true;
    } else {
      emit(SavedFailure());
      return false;
    }
  }
}
