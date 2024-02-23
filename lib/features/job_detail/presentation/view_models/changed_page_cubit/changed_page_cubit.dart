import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/core/network_info/network_info.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/apply_job_cubit/apply_job_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/bio_data_cubit/bio_data_cubit.dart';

part 'changed_page_state.dart';

class ChangedPageCubit extends Cubit<ChangedPageState> {
  NetworkInfo networkInfo;

  ChangedPageCubit({
    required this.networkInfo,
  }) : super(ChangedPageInitial());
  int currentPage = 1;

  //change page
  changePage(context, {int? current}) {
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
    required int currentPag,
    ApplyUser? applyUser,
  }) async {
    BlocProvider.of<ApplyJobCubit>(context).applyUserMethod(
      context,
      jobId: jobId,
      status: status,
      applyUser: applyUser,
      currentPage: currentPage,
    );
    if (status == StringsEn.notComplete) {
      print("not complete : $currentPag");
      changePage(context, current: currentPag);
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
  }) async {
    if (await networkInfo.isConnected) {
      //next->next->submit
      nextOrSubmit(
        context,
        jobId: jobId,
        applyUser: applyUser,
        status: status,
        currentPag: currentPage,
      );
      emit(ChangedSuccess(currentPage: currentPage));
    } else {
      emit(ChangedFailure(message: StringsEn.noInternetConnection));
    }
  }
}
