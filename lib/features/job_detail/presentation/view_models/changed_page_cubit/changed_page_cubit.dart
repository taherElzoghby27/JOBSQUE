import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/apply_job_cubit/apply_job_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/bio_data_cubit/bio_data_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/upload_portfolio_cubit/upload_portfolio_cubit.dart';

part 'changed_page_state.dart';

class ChangedPageCubit extends Cubit<ChangedPageState> {
  ChangedPageCubit() : super(ChangedPageInitial());
  int currentPage = 1;

  //change page
  changePage(context, {int? current}) {
    print("current ${(current ?? currentPage)}");
    if ((current ?? currentPage) == 1) {
      BlocProvider.of<BioDataCubit>(context).checkFieldsIsValidOrNot(context);
    } else if ((current ?? currentPage) == 2) {
      currentPage = 3;
    }
  }

  //NextOrSubmit
  nextOrSubmit(
    BuildContext context, {
    required String jobId,
    required String status,
    required int currentPage,
    ApplyUser? applyUser,
  }) {
    BlocProvider.of<ApplyJobCubit>(context).applyUser(
      context,
      jobId: jobId,
      status: status,
      applyUser: applyUser,
      currentPage: currentPage,
    );
    if (status == StringsEn.notComplete) {
      changePage(context, current: currentPage);
      applyUser!.status = StringsEn.doing;
    } else {
      changePage(context);
    }
  }

  //button (next or submit)
  buttonNextSubmit({
    required BuildContext context,
    required int currentPage,
    required String jobId,
    ApplyUser? applyUser,
    required String status,
  }) {
    //next->next->submit
    nextOrSubmit(
      context,
      jobId: jobId,
      applyUser: applyUser,
      status: status,
      currentPage: currentPage,
    );
    emit(ChangedSuccess(currentPage: currentPage));
  }
}
