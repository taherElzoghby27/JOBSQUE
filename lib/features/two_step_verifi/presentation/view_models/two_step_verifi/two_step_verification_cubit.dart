import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'two_step_verification_state.dart';

class TwoStepVerificationCubit extends Cubit<TwoStepVerificationState> {
  TwoStepVerificationCubit() : super(TwoStepVerificationInitial());

  //change switch tile
  changeSwitchTile(bool flag) {
    flag != flag;
    emit(ChangedSwitch(status: flag));
  }
}
