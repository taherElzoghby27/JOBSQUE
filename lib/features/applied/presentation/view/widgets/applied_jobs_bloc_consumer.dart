import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_loading_recent_job.dart';
import 'package:jobsque/core/widgets/fading_list_view.dart';
import 'package:jobsque/features/applied/presentation/view/widgets/section_jobs.dart';
import 'package:jobsque/features/applied/presentation/view_models/applied_job_cubit/applied_job_cubit.dart';

import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/empty_widget.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/features/home/presentation/view/widgets/loading_listview_fading.dart';

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
              widget: const CustomLoadingRecentJob(),
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
