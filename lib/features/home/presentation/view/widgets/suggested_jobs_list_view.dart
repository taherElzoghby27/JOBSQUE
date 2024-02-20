import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/features/home/presentation/view/widgets/item_suggested_jop.dart';

class SuggestedJobsListView extends StatelessWidget {
  const SuggestedJobsListView({super.key, required this.jobs});

  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
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
    );
  }
}
