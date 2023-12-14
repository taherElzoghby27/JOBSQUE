part of 'apply_job_bloc.dart';

@immutable
abstract class ApplyJobState {}

class ApplyJobInitial extends ApplyJobState {}

class ChangedPageState extends ApplyJobState {}
