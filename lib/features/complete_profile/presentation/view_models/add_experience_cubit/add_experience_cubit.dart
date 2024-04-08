import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/features/complete_profile/data/models/experience_model.dart';
import 'package:jobsque/features/complete_profile/data/repo/complete_profile_repo.dart';

import '../../../../../core/consts/strings.dart';

part 'add_experience_state.dart';

class AddExperienceCubit extends Cubit<AddExperienceState> {
  final CompleteProfileRepo _completeProfileRepo;

  AddExperienceCubit(this._completeProfileRepo) : super(AddExperienceInitial());
  String _userId = CacheHelper.getData(key: StringsEn.userId);
  List<String> _dropDownButtonsLabel = <String>[
    StringsEn.selectTypeOfWork,
    StringsEn.partTime,
    StringsEn.fullTime
  ];
  DateTime? _startYear;
  bool _isCheckedCurrentInRole = false;
  late String _typeOfWork;
  TextEditingController _position = TextEditingController();
  TextEditingController _compName = TextEditingController();
  TextEditingController _location = TextEditingController();

//user id
  set userId(String userId) {
    this._userId = userId;
  }

  String get userId => this._userId;

  //dropDownButtonsLabel
  set dropDownButtonsLabel(List<String> dropDownButtonsLabel) {
    this._dropDownButtonsLabel = dropDownButtonsLabel;
  }

  List<String> get dropDownButtonsLabel => this._dropDownButtonsLabel;

  //startYear
  set startYear(DateTime? startYear) {
    this._startYear = startYear;
  }

  DateTime? get startYear => this._startYear;

  //isCheckedCurrentInRole
  set isCheckedCurrentInRole(bool isCheckedCurrentInRole) {
    this._isCheckedCurrentInRole = isCheckedCurrentInRole;
  }

  bool get isCheckedCurrentInRole => this._isCheckedCurrentInRole;

  //typeOfWork
  set typeOfWork(String typeOfWork) {
    this._typeOfWork = typeOfWork;
  }

  String get typeOfWork => this._typeOfWork;

  //position
  set position(TextEditingController position) {
    this._position = position;
  }

  TextEditingController get position => this._position;

  //compName
  set compName(TextEditingController compName) {
    this._compName = compName;
  }

  TextEditingController get compName => this._compName;

  //location
  set location(TextEditingController location) {
    this._location = location;
  }

  TextEditingController get location => this._location;

// change typeOfWork
  changeTypeOfWork({required String value}) {
    typeOfWork = value;
    emit(ChangedTypeOfWork(value: typeOfWork));
  }

// change currentInRole
  changeCurrentInRole({required bool value}) {
    isCheckedCurrentInRole = value;
    emit(ChangedCurrentInRole(value: isCheckedCurrentInRole));
  }

// change startYear
  changeStartYear({required DateTime value}) {
    startYear = value;
    emit(ChangedDate(value: startYear!));
  }

//check fields if full or not
  bool checkFields() {
    return (position.text.isNotEmpty &&
        compName.text.isNotEmpty &&
        startYear != null &&
        location.text.isNotEmpty);
  }

//save
  addExperience() async {
    if (checkFields()) {
      emit(AddedLoading());
      Either<FailureServ, ExperienceModel> result =
          await _completeProfileRepo.addExperience(
        experModel: ExperienceModel(
          userId: userId,
          postion: position.text,
          typeWork: typeOfWork,
          compName: compName.text,
          location: location.text,
          start: startYear.toString(),
        ),
      );
      Future.delayed(Duration(seconds: 2));
      result.fold(
        (fail) => emit(AddedFailure(message: fail.message)),
        (experienceModel) async {
          await CacheHelper.saveData(
            key: StringsEn.experienceCompleteK,
            value: true,
          );
          emit(AddedSuccess());
        },
      );
    } else {
      emit(AddedFailure(message: StringsEn.fieldsNotComplted));
    }
  }
}
