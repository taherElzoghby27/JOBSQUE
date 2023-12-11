part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class JobsInitial extends HomeState {}

//jobs
class GetJobsLoading extends HomeState {}

class GetJobsLoaded extends HomeState {
  final List<Job> jobs;

  GetJobsLoaded({required this.jobs});
}

class GetJobsFailure extends HomeState {
  final String message;

  GetJobsFailure({required this.message});
}

