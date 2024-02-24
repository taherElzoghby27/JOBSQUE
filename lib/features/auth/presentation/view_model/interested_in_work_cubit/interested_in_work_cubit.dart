import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';

part 'interested_in_work_state.dart';

class InterestedInWorkCubit extends Cubit<InterestedInWorkState> {
  InterestedInWorkCubit() : super(InterestedInWorkInitial());
  Map<String, bool> workInterested = {
    StringsEn.ui: false,
    StringsEn.informationTechnology: false,
    StringsEn.developer: false,
    StringsEn.management: false,
    StringsEn.research: false,
    StringsEn.ulustratorDesigner: false,
  };

  toggleInterestedInWork({required String key, required bool status}) {
    workInterested[key] = status;
    emit(InterestedWorkState());
  }

  //check all if true or not
  bool get workInterestedHasTrue =>
      workInterested.values.any((element) => element);

  bool getStatus({required String key}) => workInterested[key]!;

  //next
  handleNextAction() async {
    emit(Loading());
    Future.delayed(Duration(seconds: 2));
    if (workInterestedHasTrue) {
      await saveInterestedIn();
    } else {
      emit(Failure());
    }
  }

//save interested in work
  saveInterestedIn() async {
    final listInterestedIn = workInterested.entries
        .where((element) => element.value)
        .map((e) => e.key)
        .toList();
    final listInterestedInString = listInterestedIn.join(' ');
    await saveInCache(interestedIn: listInterestedInString);
  }

//save in cache
  saveInCache({required String interestedIn}) async {
    await CacheHelper.saveData(
      key: StringsEn.whatTypeOfWorkInterestedKey,
      value: interestedIn,
    );
    emit(Success());
  }
}
