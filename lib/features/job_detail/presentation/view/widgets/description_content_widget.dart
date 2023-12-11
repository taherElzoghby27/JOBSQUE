import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/models/job_model.dart';

class ContentDescriptionWidget extends StatelessWidget {
  const ContentDescriptionWidget({
    super.key,
    required this.job,
  });

  final Job job;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> skill = job.jobSkill!.split("\n");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * .02.h),
          //jop description
          Text(
            StringsEn.jobDiscri,
            style: AppConsts.style14.copyWith(
              color: AppConsts.neutral900,
            ),
          ),
          SizedBox(height: size.height * .01.h),
          Text(job.jobDescription!, style: AppConsts.style12),
          SizedBox(height: size.height * .02.h),
          //skill required
          Text(
            StringsEn.skillRequired,
            style: AppConsts.style14.copyWith(
              color: AppConsts.neutral900,
            ),
          ),
          SizedBox(height: size.height * .01.h),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Text(
              "${skill[index]}.",
              style: AppConsts.style12,
            ),
            itemCount: skill.length,
          ),
        ],
      ),
    );
  }
}
