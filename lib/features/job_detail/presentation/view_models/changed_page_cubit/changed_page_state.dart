part of 'changed_page_cubit.dart';

sealed class ChangedPageState {}

final class ChangedPageInitial extends ChangedPageState {}

class ChangedLoading extends ChangedPageState {}

class ChangedSuccess extends ChangedPageState {
  final int currentPage;

  ChangedSuccess({required this.currentPage});
}

class ChangedFailure extends ChangedPageState {
  final String message;

  ChangedFailure({required this.message});
}
