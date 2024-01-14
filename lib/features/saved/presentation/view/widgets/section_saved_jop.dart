import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/home/presentation/view_models/saved_cubit/saved_cubit.dart';
import 'package:jobsque/features/saved/presentation/view/widgets/items_saved_widget.dart';

import '../../../../../core/widgets/empty_widget.dart';

class SectionSavedJop extends StatelessWidget {
  const SectionSavedJop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCubit, SavedState>(
      builder: (context, state) {
        if (state is SavedJobsLoading) {
          return LoadingWidget();
        } else if (state is SavedJobsLoaded) {
          List<Job> savedList = state.savedJobs;
          return savedList.isEmpty
              ? EmptyWidget(
                  icon: AppAssets.savedIlus,
                  title: StringsEn.noThingHasBeenSaved,
                  subTitle: StringsEn.pressTheStarIcon,
                )
              : Expanded(
                  child: ItemsSavedWidget(savedList: savedList),
                );
        } else if (state is SavedJobsFailure) {
          return showSnack(context, message: state.message);
        }
        return LoadingWidget();
      },
    );
  }
}
