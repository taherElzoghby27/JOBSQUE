import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'interested_in_work_state.dart';

class InterestedInWorkCubit extends Cubit<InterestedInWorkState> {
  InterestedInWorkCubit() : super(InterestedInWorkInitial());
  bool ui = false;
  bool illDes = false;
  bool it = false;
  bool management = false;
  bool developer = false;
  bool research = false;

  changeUIUx({required bool status}) {
    status
        ? emit(UiUxDesigner(status: false))
        : emit(UiUxDesigner(status: true));
  }

  changeDeveloper({required bool status}) {
    status ? emit(Developer(status: false)) : emit(Developer(status: true));
  }

  changeManagement({required bool status}) {
    status ? emit(Management(status: false)) : emit(Management(status: true));
  }

  changeIt({required bool status}) {
    status
        ? emit(InformationTechnology(status: false))
        : emit(InformationTechnology(status: true));
  }

  changeIllDes({required bool status}) {
    status
        ? emit(IllustratorDesigner(status: false))
        : emit(IllustratorDesigner(status: true));
  }

  changeResearch({required bool status}) {
    status
        ? emit(ResearchAndAnalytics(status: false))
        : emit(ResearchAndAnalytics(status: true));
  }
}
