import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/apply_job_cubit/apply_job_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/bio_data_cubit/bio_data_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/upload_portfolio_cubit/upload_portfolio_cubit.dart';

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
    BlocProvider.of<ApplyJobCubit>(context).applyUser(context, jobId: jobId);
    changePage(context);
  }

  //button (next or submit)
  buttonNextSubmit({
    required BuildContext context,
    required int currentPage,
    required String jobId,
  }) {
    try {
      //next->next->submit
      nextOrSubmit(context, jobId: jobId);
      //check if in last page or not
      checkInLastPageOrNot(context: context, currentPage: currentPage);
      emit(ChangedSuccess());
    } catch (error) {
      emit(ChangedFailure(message: StringsEn.someThingError));
    }
  }

//check if in last page or not
  checkInLastPageOrNot({
    required BuildContext context,
    required int currentPage,
  }) {
    final uploadPortfolioCubit = context.read<UploadPortfolioCubit>();

    if (currentPage > 2) {
      if (uploadPortfolioCubit.checkCvsIsCompleted()) {
        _pushSuccessfullyPage(context);
      } else {
        showSnack(context, message: StringsEn.eenterCv);
      }
    }
  }

  _pushSuccessfullyPage(BuildContext context) {
    GoRouter.of(context).pushReplacement(
      successfullyPagePath,
      extra: {
        StringsEn.icon: AppAssets.dataIllu,
        StringsEn.title: StringsEn.yourDataHasBeenSuccessfully,
        StringsEn.subTitle: StringsEn.youWillGetMessageFromOurTeam,
        StringsEn.labelButton: StringsEn.backToHome,
        StringsEn.path: homePath,
      },
    );
  }
}
