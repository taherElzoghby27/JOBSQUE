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
  final List<Pdf> cvs;

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
