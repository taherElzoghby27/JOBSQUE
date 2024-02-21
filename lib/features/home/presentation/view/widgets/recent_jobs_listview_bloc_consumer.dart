import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/fading_list_view.dart';
import 'package:jobsque/core/widgets/loading_widget_jobs_suggested_recent_body.dart';
import 'package:jobsque/features/home/presentation/view/widgets/loading_listview_fading.dart';
import 'package:jobsque/features/home/presentation/view_models/home_bloc/home_bloc.dart';

import '../../../../../core/widgets/error_widget.dart';
import 'recent_jobs_listview.dart';

class RecentJobsListViewBlocConsumer extends StatelessWidget {
  const RecentJobsListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is GetJobsLoaded) {
          List<Job> jobs = state.jobs;
          return RecentJobsListView(jobs: jobs);
        } else if (state is GetJobsFailure) {
          return ErrorWidg(message: state.message);
        } else {
          return CustomFadingLoadingAnimation(
            widget: FadingListView(
              scrollDirc: Axis.vertical,
              widget: const LoadingWidgetJobsSuggestedRecentBody(),
            ),
          );
        }
      },
      listener: (context, state) {},
    );
  }
}
