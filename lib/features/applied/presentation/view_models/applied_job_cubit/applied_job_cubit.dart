import 'package:bloc/bloc.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/errors/failure_message.dart';
import '../../../../../core/models/apply_user_model/apply_user_model.dart';
import '../../../../../core/models/job_model/job_model.dart';
import '../../../../home/data/repo/home_repo.dart';
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
  String status = StringsEn.active;

//get not completed jobs
  getNotCompleteJobs() async {
    try {
      emit(AppliedJobLoading());
      await getJobs();
      List<ApplyUser> appliedJobs = await appliedJobRepo.getJobsAppliedLocal();
      status = StringsEn.notComplete;
      appliedJobs = filterNotCompleteJobs(appliedJobs);
      emit(AppliedJobSuccess(applyUsers: appliedJobs));
    } catch (e) {
      emit(AppliedJobFailure(message: StringsEn.someThingError));
    }
  }

//get rejected jobs
  getRejectedJobs() async {
    emit(AppliedJobLoading());
    Either<FailureServ, List<ApplyUser>> result = await getAppliedJobRemote();
    result.fold(
      (failure) => emit(
        AppliedJobFailure(message: failure.message),
      ),
      (appliedJobs) {
        List<ApplyUser> activeJobs = filterJobs(
          appliedJobs,
          status: StringsEn.rejected,
        );
        status = StringsEn.rejected;
        emit(AppliedJobSuccess(applyUsers: activeJobs));
      },
    );
  }

  //get applied jobs
  getAppliedJobs() async {
    emit(AppliedJobLoading());
    Either<FailureServ, List<ApplyUser>> result = await getAppliedJobRemote();
    result.fold(
      (failure) => emit(
        AppliedJobFailure(message: failure.message),
      ),
      (appliedJobs) {
        List<ApplyUser> activeJobs = filterJobs(
          appliedJobs,
          status: StringsEn.active,
        );
        status = StringsEn.active;
        emit(AppliedJobSuccess(applyUsers: activeJobs));
      },
    );
  }

  //get jobs
  getJobs() async {
    Either<FailureServ, List<Job>> appliedJobs =
        await jobFilterRepo.filterJobs();
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
          .where(
            (element) => status == StringsEn.active
                ? (element.reviewed as int == 0 ||
                    element.reviewed as bool == false ||
                    element.accept == true ||
                    element.accept == null)
                : (element.accept == false || element.accept != null),
          )
          .toList();

  //filter not complete jobs
  List<ApplyUser> filterNotCompleteJobs(List<ApplyUser> appliedJobs) =>
      appliedJobs
          .where((element) => element.status != StringsEn.completed)
          .toList();

  Future<Either<FailureServ, List<ApplyUser>>> getAppliedJobRemote() async {
    String userId = CacheHelper.getData(key: StringsEn.userId);
    Either<FailureServ, List<ApplyUser>> result =
        await appliedJobRepo.getJobsAppliedRemote(
      userId: userId,
    );
    return result;
  }

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
