part of 'portfolio_cubit.dart';

sealed class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object> get props => [];
}

final class PortfolioInitial extends PortfolioState {}

//get files states
class GetFilesLoading extends PortfolioState {}

class GetFilesSuccess extends PortfolioState {
  final List<PortfolioModel>? cvs;

  GetFilesSuccess({required this.cvs});
}

class GetFilesFailure extends PortfolioState {
  final String message;

  GetFilesFailure({required this.message});
}
//add file states

class PickedFileFailure extends PortfolioState {
  final String message;

  PickedFileFailure({required this.message});
}

//deleted states
class DeletedLoading extends PortfolioState {}

class DeletedSuccess extends PortfolioState {
  final String message;

  DeletedSuccess({required this.message});
}

class DeletedFailure extends PortfolioState {
  final String message;

  DeletedFailure({required this.message});
}
