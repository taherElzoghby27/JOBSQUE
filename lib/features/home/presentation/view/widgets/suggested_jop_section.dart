import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/home/presentation/view/widgets/suggested_jobs_listview_bloc_consumer.dart';
import 'package:jobsque/features/home/presentation/view/widgets/tile_recent_suggested_widget.dart';
import '../../../../../core/consts/routesPage.dart';

class SuggestedJopSection extends StatelessWidget {
  const SuggestedJopSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        ///suggested jop       view all
        TileRecentOrSuggested(
          label: StringsEn.suggestedJob,
          onTapViewAll: () => GoRouter.of(context).push(
            suggestedOrRecentJopPath,
            extra: StringsEn.suggestedJob,
          ),
        ),

        ///suggested jops
        AspectRatio(
          aspectRatio: AppConsts.aspect13on8,
          child: SuggestedJobsListViewBlocConsumer(),
        ),
      ],
    );
  }
}
