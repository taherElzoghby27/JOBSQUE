import 'package:bloc/bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import '../../../data/repo/applied_job_repo.dart';

part 'applied_job_state.dart';

class AppliedJobCubit extends Cubit<AppliedJobState> {
  AppliedJobRepo appliedJobRepo;
  JobFilterRepo jobFilterRepo;

  AppliedJobCubit({
    required this.appliedJobRepo,
    required this.jobFilterRepo,
  }) : super(AppliedJobInitial());
  List<Job> jobs = [];

//get active jobs
  getActiveJobs() async {
    try {
      emit(AppliedJobLoading());
      await getJobs();
      List<ApplyUser> appliedJobs =
          await appliedJobRepo.getJobsAppliedLocal(userId: '2');
      List<ApplyUser> activeJobs = filterJobs(
        appliedJobs,
        status: StringsEn.active,
      );
      emit(AppliedJobSuccess(applyUsers: activeJobs));
    } catch (e) {
      emit(AppliedJobFailure(message: StringsEn.someThingError));
    }
  }

//get rejected jobs
  getRejectedJobs() async {
    try {
      emit(AppliedJobLoading());
      await getJobs();
      List<ApplyUser> appliedJobs =
          await appliedJobRepo.getJobsAppliedLocal(userId: '2');
      List<ApplyUser> rejectedJobs = filterJobs(
        appliedJobs,
        status: StringsEn.rejected,
      );
      emit(AppliedJobSuccess(applyUsers: rejectedJobs));
    } catch (e) {
      emit(AppliedJobFailure(message: e.toString()));
    }
  }

  //get jobs
  getJobs() async {
    Either<Failure, List<Job>> appliedJobs = await jobFilterRepo.filterJobs();
    appliedJobs.fold(
      (fail) => emit(AppliedJobFailure(message: fail.message)),
      (jobsList) => jobs = jobsList,
    );
  }

//filter active jobs
  List<ApplyUser> filterJobs(
    List<ApplyUser> appliedJobs, {
    required String status,
  }) =>
      appliedJobs
          .where((element) => status == StringsEn.active
              ? (element.reviewed == 0 || element.accept == true)
              : (element.accept == false))
          .toList();

  //check status for appliedJob
  int checkStatusAppliedJob({required ApplyUser applyUser}) {
    if (applyUser.status == StringsEn.completed) {
      return 4;
    } else if (applyUser.typeOfWork == 'cv') {
      return 2;
    } else if (applyUser.cvFile == null || applyUser.cvFile!.isEmpty) {
      return 3;
    } else {
      return 0;
    }
  }
}
