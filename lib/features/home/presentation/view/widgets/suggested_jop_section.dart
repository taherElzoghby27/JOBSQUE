import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/home/presentation/view/widgets/item_suggested_jop.dart';
import 'package:jobsque/features/home/presentation/view/widgets/tile_recent_suggested_widget.dart';
import 'package:jobsque/features/home/presentation/view_models/home_bloc/home_bloc.dart';
import '../../../../../core/consts/routesPage.dart';

class SuggestedJopSection extends StatelessWidget {
  const SuggestedJopSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is GetJobsLoaded) {
          List<Job> jobs = state.jobs;

          return Column(
            children: [
              ///suggested jop       view all
              TileRecentOrSuggested(
                label: StringsEn.suggestedJob,
                onTapViewAll: () =>GoRouter.of(context).push(suggestedJopPath),
              ),

              ///suggested jops
              SizedBox(
                height: size.height * .275.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return FadeAnimation(
                      millSeconds: 250,
                      child: ItemSuggestedJop(
                        onTap: () => GoRouter.of(context).push(
                          jopDetailPath,
                          extra: jobs[index],
                        ),
                        job: jobs[index],
                      ),
                    );
                  },
                  itemCount: jobs.length,
                ),
              )
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
