import 'package:flutter/material.dart';
import 'package:jobsque/core/widgets/loading_widget_jobs_suggested_recent_body.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/widgets/fading_list_view.dart';
import 'section_jobs.dart';
import '../../view_models/applied_job_cubit/applied_job_cubit.dart';

import '../../../../../core/helper/custom_snack.dart';
import '../../../../../core/models/apply_user_model/apply_user_model.dart';
import '../../../../../core/models/job_model/job_model.dart';
import '../../../../../core/widgets/empty_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/consts/assets.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../home/presentation/view/widgets/loading_listview_fading.dart';

class AppliedJobsBlocConsumer extends StatelessWidget {
  const AppliedJobsBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppliedJobCubit, AppliedJobState>(
      builder: (context, state) {
        AppliedJobCubit bloc = BlocProvider.of<AppliedJobCubit>(context);
        if (state is AppliedJobSuccess) {
          List<Job> jobs = bloc.jobs;
          List<ApplyUser> jobsApplied = state.applyUsers;
          return jobsApplied.isEmpty
              ? EmptyWidget(
                  icon: AppAssets.appliedJobR,
                  title: StringsEn.noAppWereRejected,
                  subTitle: StringsEn.ifThereIsAnApp,
                )
              : Expanded(
                  child: SectionJobs(
                    userJobs: jobsApplied,
                    jobs: jobs,
                  ),
                );
        } else {
          return CustomFadingLoadingAnimation(
            widget: FadingListView(
              scrollDirc: Axis.vertical,
              widget: const LoadingWidgetJobsSuggestedRecentBody(),
            ),
          );
        }
      },
      listener: (context, state) {
        if (state is AppliedJobFailure) {
          showSnack(
            context,
            message: StringsEn.someThingError,
            background: AppConsts.danger500,
          );
        }
      },
    );
  }
}
