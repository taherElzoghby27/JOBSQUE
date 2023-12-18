import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/apply_job_cubit/apply_job_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/bio_data_cubit/bio_data_cubit.dart';

part 'changed_page_state.dart';

class ChangedPageCubit extends Cubit<ChangedPageState> {
  ChangedPageCubit() : super(ChangedPageInitial());
  int currentPage = 1;
  //change page
  changePage(context) {
    if (currentPage == 1) {
      BlocProvider.of<BioDataCubit>(context).checkFieldsIsValidOrNot(context);
    } else if (currentPage == 2) {
      currentPage = 3;
    }
  }

  //NextOrSubmit
  nextOrSubmit(BuildContext context, {required String jobId}) {
    try {
      emit(ChangedLoading());
      BlocProvider.of<ApplyJobCubit>(context)
          .addToApplyUsersBox(context, jobId: jobId);
      changePage(context);

      emit(ChangedSuccess(current: currentPage));
    } catch (error) {
      emit(ChangedFailure(message: StringsEn.someThingError));
    }
  }
}
