import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/features/job_detail/data/repo/apply_job_repo.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/bio_data_cubit/bio_data_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/changed_page_cubit/changed_page_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/type_of_work_cubit/type_of_work_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/upload_portfolio_cubit/upload_portfolio_cubit.dart';

part 'apply_job_state.dart';

class ApplyJobCubit extends Cubit<ApplyJobState> {
  ApplyUserRepo applyUserRepo;

  ApplyJobCubit({required this.applyUserRepo}) : super(ApplyJobInitial());

  //add to apply user box
  applyUserMethod(
    BuildContext context, {
    required String jobId,
    required String status,
    required int currentPage,
    ApplyUser? applyUser,
  }) async {
    try {
      String userId = CacheHelper.getData(key: StringsEn.userId);
      BioDataCubit blocBioData = BlocProvider.of<BioDataCubit>(context);
      TypeOfWorkCubit typeOfWorkCubit =
          BlocProvider.of<TypeOfWorkCubit>(context);
      UploadPortfolioCubit portfolioCubit =
          BlocProvider.of<UploadPortfolioCubit>(context);
      //save data in hive
      Either<String, String> result = await applyUserRepo.applyJobLocal(
        applyUser: ApplyUser(
          name: status == StringsEn.notComplete
              ? applyUser!.name
              : blocBioData.nameCont.text,
          email: status == StringsEn.notComplete
              ? applyUser!.email
              : blocBioData.emailCont.text,
          phone: status == StringsEn.notComplete
              ? applyUser!.phone
              : blocBioData.phoneCont.text,
          typeOfWork: status == StringsEn.notComplete && currentPage == 3
              ? applyUser!.typeOfWork
              : typeOfWorkCubit.group,
          cvFile: portfolioCubit.cvs.isEmpty ? '' : portfolioCubit.cvs[0].path,
          cvOtherFile:
              portfolioCubit.cvs.isEmpty || portfolioCubit.cvs.length == 1
                  ? ''
                  : portfolioCubit.cvs[1].path,
          jobId: status == StringsEn.notComplete ? applyUser!.jobId : jobId,
          userId: userId,
          status:
              currentPage == 3 ? StringsEn.completed : StringsEn.unCompleted,
          reviewed: false,
          updatedAt: '${DateTime.now()}',
          createdAt: '${DateTime.now()}',
          id: 0,
        ),
      );
      //apply job

      if (currentPage == 3) {
        await applyUserRemote(
          blocBioData: blocBioData,
          typeOfWorkCubit: typeOfWorkCubit,
          portfolioCubit: portfolioCubit,
          userId: userId,
          jobId: jobId,
          status: status,
          currentPage: currentPage,
        );
      }
      result.fold(
        (failureMessage) => emit(
          ApplyJobFailure(message: failureMessage),
        ),
        (successMessage) {},
      );
    } catch (e) {
      emit(
        ApplyJobFailure(message: StringsEn.someThingError),
      );
    }
  }

  applyUserRemote({
    required BioDataCubit blocBioData,
    required TypeOfWorkCubit typeOfWorkCubit,
    required UploadPortfolioCubit portfolioCubit,
    required String userId,
    required String jobId,
    required String status,
    required int currentPage,
    ApplyUser? applyUser,
  }) async {
    emit(ApplyJobLoading());
    final result = await applyUserRepo.applyJobRemote(
      applyUser: ApplyUser(
        name: status == StringsEn.notComplete
            ? applyUser!.name
            : blocBioData.nameCont.text,
        email: status == StringsEn.notComplete
            ? applyUser!.email
            : blocBioData.emailCont.text,
        phone: status == StringsEn.notComplete
            ? applyUser!.phone
            : blocBioData.phoneCont.text,
        typeOfWork: status == StringsEn.notComplete && currentPage == 3
            ? applyUser!.typeOfWork
            : typeOfWorkCubit.group,
        cv: portfolioCubit.files[0],
        otherFiles: portfolioCubit.files[1],
        jobId: jobId,
        userId: userId,
        status: StringsEn.completed,
        reviewed: false,
        updatedAt: '${DateTime.now()}',
        createdAt: '${DateTime.now()}',
        id: 0,
      ),
    );
    result.fold(
      (failure) => emit(ApplyJobFailure(message: failure.message)),
      (success) => emit(ApplyJobSuccess()),
    );
  }
}
