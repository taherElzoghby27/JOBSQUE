import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/functions.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/custom_divider.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';

import 'custom_item_applied_job.dart';

class JobsListView extends StatelessWidget {
  const JobsListView({
    super.key,
    required this.userJobs,
    required this.jobs,
  });

  final List<ApplyUser> userJobs;
  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          Job job = filterJob(
            applyUser: userJobs[index],
            jobs: jobs,
          );
          return FadeAnimation(
            millSeconds: 250,
            child: CustomItemAppliedJop(
              job: job,
              applyUser: userJobs[index],
            ),
          );
        },
        itemCount: userJobs.length,
        separatorBuilder: (BuildContext context, int index) =>
            const CustomDivider(),
      ),
    );
  }
}
