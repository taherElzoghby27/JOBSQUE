import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/empty_widget.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/applied/presentation/view/widgets/custom_bar_applied_job.dart';
import 'package:jobsque/features/applied/presentation/view/widgets/section_jobs.dart';
import 'package:jobsque/features/applied/presentation/view_models/applied_job_cubit/applied_job_cubit.dart';

class Jobs extends StatelessWidget {
  const Jobs({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        //active - rejected
        CustomBarAppliedJob(),
        SizedBox(height: size.height * .02.h),

        BlocConsumer<AppliedJobCubit, AppliedJobState>(
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
            } else if (state is AppliedJobLoading) {
              return LoadingWidget(height: size.height * .35.h);
            }
            return EmptyWidget(
              icon: AppAssets.appliedJobR,
              title: StringsEn.noAppWereRejected,
              subTitle: StringsEn.ifThereIsAnApp,
            );
          },
          listener: (context, state) {
            if (state is Failure) {
              showSnack(context, message: StringsEn.someThingError);
            }
          },
        ),
      ],
    );
  }
}
