part of 'two_step_verification_cubit.dart';

@immutable
abstract class TwoStepVerificationState {}

class TwoStepVerificationInitial extends TwoStepVerificationState {}

class ChangedSwitch extends TwoStepVerificationState {
  final bool status;

  ChangedSwitch({required this.status});
}
