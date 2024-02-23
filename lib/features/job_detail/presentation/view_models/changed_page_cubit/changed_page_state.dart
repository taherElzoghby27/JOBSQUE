part of 'changed_page_cubit.dart';

abstract class ChangedPageState extends Equatable {
  const ChangedPageState();

  @override
  List<Object> get props => [];
}

class ChangedPageInitial extends ChangedPageState {
  const ChangedPageInitial();

  @override
  List<Object> get props => [];
}

class ChangedLoading extends ChangedPageState {
  const ChangedLoading();

  @override
  List<Object> get props => [];
}

class ChangedSuccess extends ChangedPageState {
  final int currentPage;

  const ChangedSuccess({required this.currentPage});

  @override
  List<Object> get props => [currentPage];
}

class ChangedFailure extends ChangedPageState {
  final String message;

  const ChangedFailure({required this.message});

  @override
  List<Object> get props => [message];
}