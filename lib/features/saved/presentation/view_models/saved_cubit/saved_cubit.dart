import 'package:bloc/bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/services/local_datasource/hive_db_job.dart';
import 'package:meta/meta.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  final HiveDbJob hiveDbJob;

  SavedCubit({required this.hiveDbJob}) : super(SavedInitial());
  List<Job> _savedJobsList = [];

  List<Job> get savedJobsList => _savedJobsList;

  set savedJobsList(List<Job> newValue) {
    _savedJobsList = newValue;
  }

  //changed saved
  void onChangeSaved({required Job job}) {
    final isSaved = hiveDbJob.checkSavedOrNot(job: job);

    if (isSaved) {
      deleteJobFromSavedBoxHive(job: job);
    } else {
      addJobToSavedBoxHive(job: job);
    }

    emit(OnChangedSavedState());
  }

  //check saved or not
  bool checkSavedOrNot({required Job job}) =>
      hiveDbJob.checkSavedOrNot(job: job);

//get all saved jobs
  getSavedJobs() {
    try {
      emit(SavedJobsLoading());
      hiveDbJob.get();
      savedJobsList = hiveDbJob.savedJobsList;
      emit(SavedJobsLoaded(savedJobs: savedJobsList));
    } catch (e) {
      emit(SavedJobsFailure(message: StringsEn.someThingError));
    }
  }

  //add job to saved box hive
  addJobToSavedBoxHive({required Job job}) => hiveDbJob.add(job: job);

  //delete job from saved box hive
  deleteJobFromSavedBoxHive({required Job job}) {
    hiveDbJob.delete(job: job);
    getSavedJobs();
  }
}
