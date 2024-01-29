import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/empty_widget.dart';
import 'package:jobsque/features/home/presentation/view/widgets/item_recent_jop.dart';
import 'package:jobsque/features/home/presentation/view_models/home_bloc/home_bloc.dart';

import '../../../../../core/consts/assets.dart';
import '../../../../../core/consts/routesPage.dart';
import '../../../../../core/helper/custom_snack.dart';
import '../../../../../core/models/job_model/job_model.dart';
import '../../../../../core/widgets/small_loading_widget.dart';
import '../../../../../core/widgets/tile_widget.dart';

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
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ItemRecentJop(
                              onTap: () => GoRouter.of(context).push(
                                jopDetailPath,
                                extra: jobs[index],
                              ),
                              job: jobs[index],
                            );
                          },
                          itemCount: jobs.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(color: AppConsts.neutral200),
                        ),
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
