import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/models/job_model.dart';
import 'package:jobsque/core/widgets/empty_widget.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';
import 'package:jobsque/features/home/presentation/view/widgets/item_recent_jop.dart';
import 'package:jobsque/features/search_jop/presentation/view_model/search_bloc/search_bloc.dart';

import '../../../../../core/consts/routesPage.dart';

class SectionResult extends StatelessWidget {
  const SectionResult({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is GetJobsLoaded) {
          List<Job> jobs = state.jobs;
          return jobs.isEmpty
              ? EmptyWidget(
                  icon: AppAssets.notFoundSearch,
                  title: StringsEn.searchNotFound,
                  subTitle: StringsEn.trySearchingWithDifferent,
                )
              : Column(
                  children: [
                    SizedBox(
                      height: size.height * .04.h,
                      child: TileWidget(
                          label:
                              "${StringsEn.featuring} ${jobs.length} ${StringsEn.jobs}"),
                    ),

                    ///searching jops
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemBuilder: (context, index) {
                          return FadeAnimation(
                            millSeconds: 250,
                            child: ItemRecentJop(
                              job: jobs[index],
                              onTap: () => GoRouter.of(context).push(
                                jopDetailPath,
                                extra: jobs[index],
                              ),
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
          return LoadingWidget(height: size.height * .3.h);
        } else if (state is GetJobsFailure) {
          return showSnack(context, message: state.message);
        }
        return LoadingWidget();
      },
    );
  }
}
