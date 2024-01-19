import 'package:bloc/bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:meta/meta.dart';

part 'work_location_state.dart';

class WorkLocationCubit extends Cubit<WorkLocationState> {
  WorkLocationCubit() : super(WorkLocationInitial());
  Map<String, bool> workLocation = {
    StringsEn.malaysia: false,
    StringsEn.unitedStates: false,
    StringsEn.singapore: false,
    StringsEn.indonesia: false,
    StringsEn.philiphines: false,
    StringsEn.polandia: false,
    StringsEn.vietnam: false,
    StringsEn.china: false,
    StringsEn.india: false,
    StringsEn.saudiArabia: false,
    StringsEn.canada: false,
    StringsEn.brazil: false,
    StringsEn.argentina: false,
    StringsEn.egypt: false,
  };
//set value
  void toggleWorkInterest({required String key, required bool status}) {
    workLocation[key] = status;
    emit(InterestedInWorkState());
  }

//get status
  bool getStatus({required String key}) => workLocation[key]!;

  //change work type
  changeWorkType({required String type}) {
    if (type == StringsEn.remoteWork) {
      emit(WorkLocationType(typeWork: StringsEn.remoteWork));
    } else {
      emit(WorkLocationType(typeWork: StringsEn.workFromOffice));
    }
  }

//if any true return true
  bool get hasSelectedWorkInterest =>
      workLocation.values.any((status) => status);
//handle Next action
  Future<bool> handleNextAction() async {
    if (hasSelectedWorkInterest) {
      await saveWorkInterests();
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveWorkInterests() async {
    final selectedInterests = workLocation.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    final joinedInterests = selectedInterests.join(' ');
    await CacheHelper.saveData(
      key: StringsEn.whereAreYouLocation,
      value: joinedInterests,
    );
  }
}
