import 'package:flutter/material.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/models/apply_user_model/apply_user_model.dart';
import '../../../../../core/models/job_model/job_model.dart';
import '../../../../../core/widgets/tile_widget.dart';
import 'jobs_list_view.dart';

class SectionJobs extends StatelessWidget {
  const SectionJobs({
    super.key,
    required this.userJobs,
    required this.jobs,
  });

  final List<ApplyUser> userJobs;
  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        TileWidget(label: '${userJobs.length} ${StringsEn.jobs}'),
        JobsListView(userJobs: userJobs, jobs: jobs),
      ],
    );
  }
}
