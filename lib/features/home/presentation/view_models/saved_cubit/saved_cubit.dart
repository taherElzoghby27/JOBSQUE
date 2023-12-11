import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/models/job_model.dart';
import 'package:meta/meta.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedInitial());
  Box<Job> savedJobBox = Hive.box<Job>(StringsEn.savedJobsBox);
  List<Job> savedJobsList = [];

  //changed saved
  void onChangeSaved({required Job job}) {
    final isSaved = savedJobBox.containsKey(job.id as int);
    if (isSaved) {
      deleteJobFromSavedBoxHive(job: job);
    } else {
      addJobToSavedBoxHive(job: job);
    }

    emit(OnChangedSavedState(isSaved: !isSaved));
  }

  //check saved or not
  bool checkSavedOrNot({required Job job}) =>
      savedJobBox.containsKey(job.id as int);

//get all saved jobs
  getSavedJobs() {
    try {
      emit(SavedJobsLoading());
      List<Job> savedJobs = List<Job>.from(
        (savedJobBox.values).map((job) => job),
      ).toList();
      savedJobsList = savedJobs;
      emit(SavedJobsLoaded(savedJobs: savedJobsList));
    } catch (e) {
      emit(SavedJobsFailure(message: e.toString()));
    }
  }

  //add job to saved box hive
  addJobToSavedBoxHive({required Job job}) {
    savedJobBox.put(job.id as int, job);
  }

  //delete job from saved box hive
  deleteJobFromSavedBoxHive({required Job job}) {
    savedJobBox.delete(job.id as int);
    getSavedJobs();
  }
}
