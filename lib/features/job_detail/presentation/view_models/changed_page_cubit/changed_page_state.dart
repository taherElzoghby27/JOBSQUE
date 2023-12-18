part of 'changed_page_cubit.dart';

sealed class ChangedPageState {}

final class ChangedPageInitial extends ChangedPageState {}

class ChangedSuccess extends ChangedPageState {
  final int current;

  ChangedSuccess({required this.current});
}

class ChangedLoading extends ChangedPageState {}

class ChangedFailure extends ChangedPageState {
  final String message;

  ChangedFailure({required this.message});
}
