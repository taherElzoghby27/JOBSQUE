import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import '../../../../../core/models/job_model/job_model.dart';
import 'item_suggested_jop.dart';

class JobsList extends StatelessWidget {
  const JobsList({
    super.key,
    required this.jobs,
  });

  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ItemSuggestedJop(
          onTap: () => GoRouter.of(context).push(
            jopDetailPath,
            extra: jobs[index],
          ),
          job: jobs[index],
        );
      },
      itemCount: jobs.length,
    );
  }
}
