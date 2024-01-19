import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';

part 'interested_in_work_state.dart';

class InterestedInWorkCubit extends Cubit<InterestedInWorkState> {
  InterestedInWorkCubit() : super(InterestedInWorkInitial());
  bool ui = false;
  bool illDes = false;
  bool it = false;
  bool management = false;
  bool developer = false;
  bool research = false;
  String interesedInWork = "";

  changeUIUx({required bool status}) {
    if (status) {
      emit(UiUxDesigner(status: false));
      ui = false;
    } else {
      emit(UiUxDesigner(status: true));
      ui = true;
    }
  }

  changeDeveloper({required bool status}) {
    if (status) {
      emit(Developer(status: false));
      developer = false;
    } else {
      emit(Developer(status: true));
      developer = true;
    }
  }

  changeManagement({required bool status}) {
    if (status) {
      emit(Management(status: false));
      management = false;
    } else {
      emit(Management(status: true));
      management = true;
    }
  }

  changeIt({required bool status}) {
    if (status) {
      emit(InformationTechnology(status: false));
      it = false;
    } else {
      emit(InformationTechnology(status: true));
      it = true;
    }
  }

  changeIllDes({required bool status}) {
    if (status) {
      emit(IllustratorDesigner(status: false));
      illDes = false;
    } else {
      emit(IllustratorDesigner(status: true));
      illDes = true;
    }
  }

  changeResearch({required bool status}) {
    if (status) {
      emit(ResearchAndAnalytics(status: false));
      research = false;
    } else {
      emit(ResearchAndAnalytics(status: true));
      research = true;
    }
  }

  //check all if true or not
  bool get checkTrueOrNot =>
      !it && !developer && !management && !research && !ui && !illDes
          ? false
          : true;

  //next
  bool next() {
    if (checkTrueOrNot) {
      saveInterestedIn();
      return true;
    } else {
      return false;
    }
  }

//save interested in work
  saveInterestedIn() {
    if (it) {
      interesedInWork += StringsEn.informationTechnology + " ";
    }
    if (ui) {
      interesedInWork += StringsEn.ui + " ";
    }
    if (illDes) {
      interesedInWork += StringsEn.ulustratorDesigner + " ";
    }
    if (management) {
      interesedInWork += StringsEn.management + " ";
    }
    if (developer) {
      interesedInWork += StringsEn.developer + " ";
    }
    if (research) {
      interesedInWork += StringsEn.research + " ";
    }
    saveInCache();
  }

//save in cache
  saveInCache() async {
    await CacheHelper.saveData(
      key: StringsEn.whatTypeOfWorkInterested,
      value: interesedInWork,
    );
    print(interesedInWork);
    print(await CacheHelper.getData(key: StringsEn.whatTypeOfWorkInterested));
  }
}
