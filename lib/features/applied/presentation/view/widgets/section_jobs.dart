import 'package:flutter/material.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/functions.dart';
import '../../../../../core/models/apply_user_model/apply_user_model.dart';
import '../../../../../core/models/job_model/job_model.dart';
import '../../../../../core/widgets/custom_divider.dart';
import '../../../../../core/widgets/fade_animation_widget.dart';
import '../../../../../core/widgets/tile_widget.dart';
import 'custom_item_applied_job.dart';

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
        Padding(
          padding: AppConsts.mainPadding,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              Job job = filterJob(
                applyUser: userJobs[index],
                jobs: jobs,
              ).first;
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
        ),
      ],
    );
  }
}
