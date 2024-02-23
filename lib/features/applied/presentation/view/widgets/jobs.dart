import 'package:flutter/material.dart';
import '../../../../../core/consts/style.dart';
import 'custom_bar_applied_job.dart';

import 'applied_jobs_bloc_consumer.dart';

class JobsWidget extends StatelessWidget {
  const JobsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //active - rejected -not completed
        const CustomBarAppliedJob(),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),

        const AppliedJobsBlocConsumer(),
        const AspectRatio(aspectRatio: AppConsts.aspect16on2),
      ],
    );
  }
}
