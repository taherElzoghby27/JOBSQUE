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
  String userId = CacheHelper.getData(key: StringsEn.userId);
  List<String> dropDownButtonsLabel = <String>[
    StringsEn.selectTypeOfWork,
    StringsEn.partTime,
    StringsEn.fullTime
  ];
  DateTime? startYear;
  bool isCheckedCurrentInRole = false;
  late String typeOfWork;
  TextEditingController position = TextEditingController();
  TextEditingController compName = TextEditingController();
  TextEditingController location = TextEditingController();

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
  bool chechFields() {
    return (position.text.isNotEmpty &&
        compName.text.isNotEmpty &&
        startYear != null &&
        location.text.isNotEmpty);
  }

//save
  addExperience() async {
    if (chechFields()) {
      emit(AddedLoading());
      Either<Failure, ExperienceModel> result =
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
      emit(AddedFailure(message: 'Please ,enter your Information'));
    }
  }
}
