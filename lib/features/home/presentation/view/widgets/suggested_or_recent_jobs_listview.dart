import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';
import 'package:jobsque/features/home/presentation/view/widgets/jobs_list.dart';

import '../../../../../core/consts/strings.dart';

class SuggestedOrRecentJobsListView extends StatelessWidget {
  const SuggestedOrRecentJobsListView({
    super.key,
    required this.jobs,
  });

  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        //(number) jobs
        SizedBox(
          height: size.height * .04.h,
          child: TileWidget(
            label: "${jobs.length} ${StringsEn.suggestedJob}",
            textAlign: TextAlign.center,
          ),
        ),
        JobsList(jobs: jobs),
      ],
    );
  }
}
