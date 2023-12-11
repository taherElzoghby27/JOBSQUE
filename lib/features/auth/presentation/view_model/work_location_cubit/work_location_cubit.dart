import 'package:bloc/bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:meta/meta.dart';

part 'work_location_state.dart';

class WorkLocationCubit extends Cubit<WorkLocationState> {
  WorkLocationCubit() : super(WorkLocationInitial());

  //change work type
  changeWorkType({required String type}) {
    if (type == StringsEn.remoteWork) {
      emit(WorkLocationType(typeWork: StringsEn.remoteWork));
    } else {
      emit(WorkLocationType(typeWork: StringsEn.workFromOffice));
    }
  }
}
