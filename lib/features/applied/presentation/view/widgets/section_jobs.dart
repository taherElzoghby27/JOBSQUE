import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/custom_divider.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';
import 'package:jobsque/features/applied/presentation/view/widgets/custom_item_applied_job.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              Job job = filterJob(userJobs[index]).first;
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
                CustomDivider(),
          ),
        ),
      ],
    );
  }

//filterJob
  List<Job> filterJob(ApplyUser applyUser) => jobs
      .where(
        (e) => e.id.toString() == applyUser.jobId,
      )
      .toList();
}
