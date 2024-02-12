import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/custom_divider.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/features/home/presentation/view/widgets/item_recent_jop.dart';

class RecentJobsListView extends StatelessWidget {
  const RecentJobsListView({super.key, required this.jobs});

  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      reverse: true,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return FadeAnimation(
          millSeconds: 250,
          child: ItemRecentJop(
            onTap: () => GoRouter.of(context).push(
              jopDetailPath,
              extra: jobs[index],
            ),
            job: jobs[index],
          ),
        );
      },
      itemCount: jobs.length,
      separatorBuilder: (BuildContext context, int index) =>
          const CustomDivider(),
    );
  }
}
