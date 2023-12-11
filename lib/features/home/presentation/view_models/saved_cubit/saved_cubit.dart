import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedInitial());
  bool isSaved = false;

  //changed saved
  onChangeSaved() {
    if (isSaved) {
      //un save job to hive
      isSaved = false;
    } else {
      // save job to hive
      isSaved = true;
    }
    emit(OnChangedSavedState(isSaved: isSaved));
  }
}
