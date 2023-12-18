import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/bio_data_cubit/bio_data_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/changed_page_cubit/changed_page_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/type_of_work_cubit/type_of_work_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/upload_portfolio_cubit/upload_portfolio_cubit.dart';

import '../../../../../core/services/local_database/hive_db_apply_user.dart';

part 'apply_job_state.dart';

class ApplyJobCubit extends Cubit<ApplyJobState> {
  ApplyJobCubit({required this.hiveDbApplyUser}) : super(ApplyJobInitial());

  final HiveDbApplyUser hiveDbApplyUser;

  //add to apply user box
  addToApplyUsersBox(BuildContext context, {required String jobId}) {
    BioDataCubit blocBioData = BlocProvider.of<BioDataCubit>(context);
    TypeOfWorkCubit typeOfWorkCubit = BlocProvider.of<TypeOfWorkCubit>(context);
    ChangedPageCubit changedPageCubit =
        BlocProvider.of<ChangedPageCubit>(context);
    UploadPortfolioCubit portfolioCubit =
        BlocProvider.of<UploadPortfolioCubit>(context);
    hiveDbApplyUser.add(
      user: ApplyUser(
        name: blocBioData.nameCont.text,
        email: blocBioData.emailCont.text,
        phone: blocBioData.phoneCont.text,
        typeOfWork: typeOfWorkCubit.group,
        cv: portfolioCubit.cvs.isEmpty ? '' : portfolioCubit.cvs[0].path!,
        otherFiles: portfolioCubit.cvs.isEmpty || portfolioCubit.cvs.length == 1
            ? ''
            : portfolioCubit.cvs[1].path!,
        jobId: jobId,
        userId: StringsEn.userId,
        status: changedPageCubit.currentPage == 3
            ? StringsEn.completed
            : StringsEn.unCompleted,
      ),
    );

    hiveDbApplyUser.get();
  }
}
