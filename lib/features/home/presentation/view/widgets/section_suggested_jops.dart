import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/empty_widget.dart';
import 'package:jobsque/features/home/presentation/view_models/home_bloc/home_bloc.dart';

import '../../../../../core/consts/assets.dart';
import '../../../../../core/helper/custom_snack.dart';
import '../../../../../core/models/job_model/job_model.dart';
import '../../../../../core/widgets/small_loading_widget.dart';
import '../../../../../core/widgets/tile_widget.dart';
import 'jobs_list.dart';

class SectionSuggestedOrRecentJops extends StatelessWidget {
  const SectionSuggestedOrRecentJops({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is GetJobsLoading) {
          return LoadingWidget(height: size.height * .4.h);
        } else if (state is GetJobsLoaded) {
          List<Job> jobs = state.jobs;
          return jobs.isEmpty
              ? EmptyWidget(
                  icon: AppAssets.savedIlus,
                  title: StringsEn.noThingHasBeenSaved,
                  subTitle: StringsEn.pressTheStarIcon,
                )
              : Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      //(number) jobs
                      SizedBox(
                        height: size.height * .04.h,
                        child: TileWidget(
                          label: "${jobs.length} ${StringsEn.suggestedJob}",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: JobsList(jobs: jobs),
                      ),
                    ],
                  ),
                );
        } else if (state is GetJobsFailure) {
          return showSnack(context, message: state.message);
        }
        return LoadingWidget(height: size.height * .4.h);
      },
    );
  }
}
