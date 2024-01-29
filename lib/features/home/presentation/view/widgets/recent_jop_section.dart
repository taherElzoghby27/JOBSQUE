import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/features/home/presentation/view/widgets/item_recent_jop.dart';
import 'package:jobsque/features/home/presentation/view/widgets/tile_recent_suggested_widget.dart';

import '../../../../../core/models/job_model/job_model.dart';
import '../../../../../core/widgets/small_loading_widget.dart';
import '../../view_models/home_bloc/home_bloc.dart';

class RecentJopSection extends StatelessWidget {
  const RecentJopSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is GetJobsLoaded) {
          List<Job> jobs = state.jobs;
          return Column(
            children: [
              ///recent jop       view all
              TileRecentOrSuggested(
                label: StringsEn.recentJob,
                onTapViewAll: () => GoRouter.of(context).push(
                  suggestedOrRecentJopPath,
                  extra: StringsEn.recentJob,
                ),
              ),

              ///recent jops
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView.separated(
                  reverse: true,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return FadeAnimation(
                      millSeconds: 250,
                      child: ItemRecentJop(
                        onTap: () => GoRouter.of(context).push(
                          jopDetailPath,
                          extra: jobs[index],
                        ),
                        job: jobs[index],
                      ),
                    );
                  },
                  itemCount: jobs.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(color: AppConsts.neutral200),
                ),
              ),
            ],
          );
        } else if (state is GetJobsLoading) {
          return SizedBox(
            height: size.height * .275.h,
            child: Center(child: LoadingWidget()),
          );
        } else if (state is GetJobsFailure) {
          return Text('error');
        }
        return SizedBox(
          height: size.height * .275.h,
          child: Center(child: LoadingWidget()),
        );
      },
    );
  }
}
