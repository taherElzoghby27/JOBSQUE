import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/custom_loading_suggested_job.dart';
import 'package:jobsque/core/widgets/fading_list_view.dart';
import 'package:jobsque/features/home/presentation/view_models/home_bloc/home_bloc.dart';

import '../../../../../core/widgets/error_widget.dart';
import 'loading_listview_fading.dart';
import 'suggested_jobs_list_view.dart';

class SuggestedJobsListViewBlocBuilder extends StatelessWidget {
  const SuggestedJobsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is GetJobsLoaded) {
          List<Job> jobs = state.jobs;
          return SuggestedJobsListView(jobs: jobs);
        } else if (state is GetJobsFailure) {
          return ErrorWid(message: state.message);
        } else {
          return const CustomFadingLoadingAnimation(
            widget: FadingListView(
              scrollDirc: Axis.horizontal,
              widget: CustomLoadingSuggestedJob(),
            ),
          );
        }
      },
    );
  }
}
