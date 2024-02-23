part of 'upload_portfolio_cubit.dart';

abstract class UploadPortfolioState extends Equatable {
  const UploadPortfolioState();

  @override
  List<Object?> get props => [];
}

class UploadPortfolioInitial extends UploadPortfolioState {
  const UploadPortfolioInitial();
}

class GetFilesLoading extends UploadPortfolioState {
  const GetFilesLoading();
}

class GetFilesSuccess extends UploadPortfolioState {
  final List<Pdf> cvs;

  const GetFilesSuccess({required this.cvs});

  @override
  List<Object?> get props => [cvs];
}

class GetFilesFailure extends UploadPortfolioState {
  final String message;

  const GetFilesFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

class PickedFileFailure extends UploadPortfolioState {
  final String message;

  const PickedFileFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
