part of 'apply_job_cubit.dart';

@immutable
abstract class ApplyJobState extends Equatable {
  const ApplyJobState();
}

class ApplyJobInitial extends ApplyJobState {
  @override
  List<Object> get props => [];
}
