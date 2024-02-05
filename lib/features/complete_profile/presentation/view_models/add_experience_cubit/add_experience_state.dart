part of 'add_experience_cubit.dart';

@immutable
abstract class AddExperienceState {}

class AddExperienceInitial extends AddExperienceState {}

class AddedSuccess extends AddExperienceState {}

class AddedLoading extends AddExperienceState {}

class AddedFailure extends AddExperienceState {
  final String message;

  AddedFailure({required this.message});
}

class ChangedTypeOfWork extends AddExperienceState {
  final String value;

  ChangedTypeOfWork({required this.value});
}

class ChangedDate extends AddExperienceState {
  final DateTime value;

  ChangedDate({required this.value});
}

class ChangedCurrentInRole extends AddExperienceState {
  final bool value;

  ChangedCurrentInRole({required this.value});
}
