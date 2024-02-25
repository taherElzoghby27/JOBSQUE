import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/home/presentation/view/widgets/recent_jobs_listview_bloc_consumer.dart';
import 'package:jobsque/features/home/presentation/view/widgets/tile_recent_suggested_widget.dart';

class RecentJopSection extends StatelessWidget {
  const RecentJopSection({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: AppConsts.mainPadding,
          child: const RecentJobsListViewBlocConsumer(),
        ),
      ],
    );
  }
}
