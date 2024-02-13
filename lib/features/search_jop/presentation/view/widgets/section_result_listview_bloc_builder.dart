import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_loading_recent_job.dart';
import 'package:jobsque/core/widgets/empty_widget.dart';
import 'package:jobsque/core/widgets/error_widget.dart';
import 'package:jobsque/features/home/presentation/view/widgets/loading_listview_fading.dart';
import 'package:jobsque/features/search_jop/presentation/view_model/search_bloc/search_cubit.dart';

import '../../../../../core/consts/assets.dart';
import '../../../../../core/models/job_model/job_model.dart';
import 'searching_listview.dart';

class SectionResultListViewBlocBuilder extends StatelessWidget {
  const SectionResultListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is GetJobsLoaded) {
          List<Job> jobs = state.jobs;
          return jobs.isEmpty
              ? const EmptyWidget(
                  icon: AppAssets.notFoundSearch,
                  title: StringsEn.searchNotFound,
                  subTitle: StringsEn.trySearchingWithDifferent,
                )
              : SearchingListView(jobs: jobs);
        } else if (state is GetJobsFailure) {
          return ErrorWidg(message: state.message);
        } else {
          return const CustomFadingLoadingWidgetList(
            scrollDirc: Axis.vertical,
            widget: CustomLoadingRecentJob(),
          );
        }
      },
    );
  }
}
