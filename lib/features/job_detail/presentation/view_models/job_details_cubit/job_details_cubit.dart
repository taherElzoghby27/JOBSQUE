import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'job_details_state.dart';

class JobDetailsCubit extends Cubit<JobDetailsState> {
  JobDetailsCubit() : super(JobDetailsInitial());
  int _current = 0;

  set current(int current) {
    this._current = current;
  }

  int get current => this._current;

  change({required int index}) {
    current = index;
    emit(Change());
  }
}
