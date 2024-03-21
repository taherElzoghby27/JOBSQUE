import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/error_widget.dart';
import 'package:jobsque/core/widgets/fading_list_view.dart';
import 'package:jobsque/core/widgets/loading_widget_jobs_suggested_recent_body.dart';
import 'package:jobsque/features/home/presentation/view/widgets/loading_listview_fading.dart';
import 'package:jobsque/features/saved/presentation/view/widgets/saved_jobs_widget.dart';
import 'package:jobsque/features/saved/presentation/view_models/saved_cubit/saved_cubit.dart';

import '../../../../../core/widgets/empty_widget.dart';

class SectionSavedJobsBlocBuilder extends StatelessWidget {
  const SectionSavedJobsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCubit, SavedState>(
      builder: (context, state) {
        if (state is SavedJobsLoaded) {
          List<Job> savedList = state.savedJobs;
          return savedList.isEmpty
              ? EmptyWidget(
                  icon: AppAssets.savedIlus,
                  title: StringsEn.noThingHasBeenSaved,
                  subTitle: StringsEn.pressTheStarIcon,
                )
              : SavedJobsWidget(savedList: savedList);
        } else if (state is SavedJobsFailure) {
          return ErrorWid(message: state.message);
        } else {
          return const CustomFadingLoadingAnimation(
            widget: FadingListView(
              scrollDirc: Axis.vertical,
              widget: LoadingWidgetJobsSuggestedRecentBody(),
            ),
          );
        }
      },
    );
  }
}
