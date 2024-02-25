import 'package:flutter/material.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';
import 'package:jobsque/core/consts/strings.dart';

import 'jobs_list.dart';

class SuggestedOrRecentJobsListView extends StatelessWidget {
  const SuggestedOrRecentJobsListView({super.key, required this.jobs});

  final List<Job> jobs;

  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        //(number) jobs
        TileWidget(
          label: "${jobs.length} ${StringsEn.suggestedJob}",
          textAlign: TextAlign.center,
        ),
        JobsList(jobs: jobs),
      ],
    );
  }
}
