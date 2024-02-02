part of 'applied_job_cubit.dart';

@immutable
abstract class AppliedJobState {}

class AppliedJobInitial extends AppliedJobState {}

class AppliedJobLoading extends AppliedJobState {}

class AppliedJobSuccess extends AppliedJobState {
  final List<ApplyUser> applyUsers;

  AppliedJobSuccess({required this.applyUsers});
}

class Failure extends AppliedJobState {
  final String message;

  Failure({required this.message});
}

