part of 'add_education_cubit.dart';

@immutable
abstract class AddEducationState {}

class AddEducationInitial extends AddEducationState {}

class AddedSuccessfullyState extends AddEducationState {}

class AddedFailureState extends AddEducationState {
  final String message;

  AddedFailureState({required this.message});
}

class AddedLoadingState extends AddEducationState {}

class ChangedDateState extends AddEducationState {}
