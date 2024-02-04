part of 'apply_job_cubit.dart';

@immutable
abstract class ApplyJobState {}

class ApplyJobInitial extends ApplyJobState {}

class ApplyJobLoading extends ApplyJobState {}

class ApplyJobSuccess extends ApplyJobState {}

class ApplyJobFailure extends ApplyJobState {
  final String message;

  ApplyJobFailure({required this.message});
}
