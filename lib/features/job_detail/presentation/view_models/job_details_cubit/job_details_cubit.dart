import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'job_details_state.dart';

class JobDetailsCubit extends Cubit<JobDetailsState> {
  JobDetailsCubit() : super(JobDetailsInitial());
  int current = 0;

  change({required int index}) {
    current = index;
    emit(Change());
  }
}
