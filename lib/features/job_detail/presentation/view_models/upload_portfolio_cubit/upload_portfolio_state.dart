part of 'upload_portfolio_cubit.dart';

abstract class UploadPortfolioState {}

class UploadPortfolioInitial extends UploadPortfolioState {}

//get files states
class GetFilesLoading extends UploadPortfolioState {}

class GetFilesSuccess extends UploadPortfolioState {
  final List<Pdf> cvs;

  GetFilesSuccess({required this.cvs});
}

class GetFilesFailure extends UploadPortfolioState {
  final String message;

  GetFilesFailure({required this.message});
}
//add file states

class PickedFileFailure extends UploadPortfolioState {
  final String message;

  PickedFileFailure({required this.message});
}
