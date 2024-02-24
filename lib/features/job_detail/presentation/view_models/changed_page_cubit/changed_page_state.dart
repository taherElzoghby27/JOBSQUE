part of 'changed_page_cubit.dart';

abstract class ChangedPageState{
}

class ChangedPageInitial extends ChangedPageState {
  List<Object> get props => [];
}

class ChangedLoading extends ChangedPageState {
}

class ChangedSuccess extends ChangedPageState {
  final int currentPage;

   ChangedSuccess({required this.currentPage});
}

class ChangedFailure extends ChangedPageState {
  final String message;

   ChangedFailure({required this.message});
}