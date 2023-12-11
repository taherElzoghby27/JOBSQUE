part of 'saved_cubit.dart';

@immutable
abstract class SavedState {}

class SavedInitial extends SavedState {}
//saved or not
class OnChangedSavedState extends SavedState {
  final bool isSaved;

  OnChangedSavedState({required this.isSaved});
}
