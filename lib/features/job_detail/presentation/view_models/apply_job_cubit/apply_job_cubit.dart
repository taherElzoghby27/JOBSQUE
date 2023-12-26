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

import '../../../../../core/services/local_database/hive_db_apply_user.dart';

part 'apply_job_state.dart';

class ApplyJobCubit extends Cubit<ApplyJobState> {
  ApplyUserRepo applyUserRepo;
  ApplyJobCubit({
    required this.applyUserRepo,
    required this.hiveDbApplyUser,
  }) : super(ApplyJobInitial());

  final HiveDbApplyUser hiveDbApplyUser;

  //add to apply user box
  applyUser(BuildContext context, {required String jobId}) async {
    try {
      emit(ApplyJobLoading());
      String userId = CacheHelper.getData(key: StringsEn.userId);
      BioDataCubit blocBioData = BlocProvider.of<BioDataCubit>(context);
      TypeOfWorkCubit typeOfWorkCubit =
          BlocProvider.of<TypeOfWorkCubit>(context);
      ChangedPageCubit changedPageCubit =
          BlocProvider.of<ChangedPageCubit>(context);
      UploadPortfolioCubit portfolioCubit =
          BlocProvider.of<UploadPortfolioCubit>(context);
      //save data in hive
      hiveDbApplyUser.add(
        user: ApplyUser(
          name: blocBioData.nameCont.text,
          email: blocBioData.emailCont.text,
          phone: blocBioData.phoneCont.text,
          typeOfWork: typeOfWorkCubit.group,
          cvFile: portfolioCubit.cvs.isEmpty ? '' : portfolioCubit.cvs[0].path,
          cvOtherFile:
              portfolioCubit.cvs.isEmpty || portfolioCubit.cvs.length == 1
                  ? ''
                  : portfolioCubit.cvs[1].path,
          jobId: jobId,
          userId: userId,
          status: changedPageCubit.currentPage == 3
              ? StringsEn.completed
              : StringsEn.unCompleted,
          reviewed: false,
          updatedAt: '${DateTime.now()}',
          createdAt: '${DateTime.now()}',
          id: 0,
        ),
      );

      //apply job
      changedPageCubit.currentPage == 3
          ? applyUserRepo.applyJob(
              applyUser: ApplyUser(
                name: blocBioData.nameCont.text,
                email: blocBioData.emailCont.text,
                phone: blocBioData.phoneCont.text,
                typeOfWork: typeOfWorkCubit.group,
                cv: portfolioCubit.files[0],
                otherFiles: portfolioCubit.files.isEmpty ||
                        portfolioCubit.files.length == 1
                    ? null
                    : portfolioCubit.files[1],
                jobId: jobId,
                userId: userId,
                status: StringsEn.completed,
                reviewed: false,
                updatedAt: '${DateTime.now()}',
                createdAt: '${DateTime.now()}',
                id: 0,
              ),
            )
          : () {};

      hiveDbApplyUser.get();
      emit(ApplyJobSuccess());
    } catch (error) {
      emit(ApplyJobFailure());
    }
  }
}
