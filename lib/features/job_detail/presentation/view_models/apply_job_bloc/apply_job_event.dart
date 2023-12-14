part of 'apply_job_bloc.dart';

@immutable
abstract class ApplyJobEvent {}

class NextOrSubmitEvent extends ApplyJobEvent {}
