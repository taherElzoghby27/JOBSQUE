import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/empty_widget.dart';
import 'package:jobsque/core/widgets/error_widget.dart';
import 'package:jobsque/core/widgets/fading_list_view.dart';
import 'package:jobsque/core/widgets/smart_fresher.dart';
import 'package:jobsque/features/home/presentation/view/widgets/loading_listview_fading.dart';
import 'package:jobsque/features/home/presentation/view/widgets/suggested_or_recent_jobs_listview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../core/consts/assets.dart';
import '../../../../../core/widgets/custom_loading_suggested_job.dart';
import '../../view_models/home_bloc/home_bloc.dart';

class SectionSuggestedOrRecentJopsListViewBlocBuilder extends StatefulWidget {
  const SectionSuggestedOrRecentJopsListViewBlocBuilder({super.key});

  @override
  State<SectionSuggestedOrRecentJopsListViewBlocBuilder> createState() =>
      _SectionSuggestedOrRecentJopsListViewBlocBuilderState();
}

class _SectionSuggestedOrRecentJopsListViewBlocBuilderState
    extends State<SectionSuggestedOrRecentJopsListViewBlocBuilder> {
  RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  void _onRefresh() async {
    BlocProvider.of<HomeBloc>(context).add(GetJobsEvent());
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefreshWidget(
      refreshController: _refreshController,
      onRefresh: _onRefresh,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is GetJobsLoaded) {
            List<Job> jobs = state.jobs;
            return jobs.isEmpty
                ? EmptyWidget(
                    icon: AppAssets.savedIlus,
                    title: StringsEn.noThingHasBeenSaved,
                    subTitle: StringsEn.pressTheStarIcon,
                  )
                : Expanded(
                    child: SuggestedOrRecentJobsListView(jobs: jobs),
                  );
          } else if (state is GetJobsFailure) {
            return ErrorWidg(message: state.message);
          } else {
            return const CustomFadingLoadingAnimation(
              widget: FadingListView(
                scrollDirc: Axis.vertical,
                widget: CustomLoadingSuggestedJob(),
              ),
            );
          }
        },
      ),
    );
  }
}
