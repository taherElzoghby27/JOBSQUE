part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
//filter jobs
class GetJobsLoading extends SearchState {}

class GetJobsLoaded extends SearchState {
  final List<Job> jobs;

  GetJobsLoaded({required this.jobs});
}

class GetJobsFailure extends SearchState {
  final String message;

  GetJobsFailure({required this.message});
}

