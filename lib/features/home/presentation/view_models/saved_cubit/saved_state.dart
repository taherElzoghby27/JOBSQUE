part of 'saved_cubit.dart';

@immutable
abstract class SavedState {}

class SavedInitial extends SavedState {}

//saved or not
class OnChangedSavedState extends SavedState {
}

class CheckSavedState extends SavedState {}

class SavedJobsLoaded extends SavedState {
  final List<Job> savedJobs;

  SavedJobsLoaded({required this.savedJobs});
}

class SavedJobsLoading extends SavedState {}

class SavedJobsFailure extends SavedState {
  final String message;

  SavedJobsFailure({required this.message});
}
