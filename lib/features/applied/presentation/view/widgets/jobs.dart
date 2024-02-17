import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/applied/presentation/view/widgets/custom_bar_applied_job.dart';

import 'applied_jobs_bloc_consumer.dart';

class Jobs extends StatelessWidget {
  const Jobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //active - rejected
        const CustomBarAppliedJob(),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),

        const AppliedJobsBlocConsumer(),
        const AspectRatio(aspectRatio: AppConsts.aspect16on2),
      ],
    );
  }
}
