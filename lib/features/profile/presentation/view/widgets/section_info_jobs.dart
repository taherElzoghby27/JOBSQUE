import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';

import 'applied_info_widget.dart';
import 'item_info_job.dart';

class SectionInfoJobs extends StatelessWidget {
  const SectionInfoJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:AppConsts.mainPadding,
      child: Container(
        decoration: AppConsts.decorationRadius8.copyWith(
          color: AppConsts.neutral300.withOpacity(.1),
          border: Border.all(
            color: AppConsts.neutral300.withOpacity(.1),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppliedInfoWidget(),
              //Divider(color: AppConsts.neutral300,height: 30.h),
              ItemInfoJob(title: StringsEn.reviewed, subTitle: '0'),
              // Divider(color: AppConsts.neutral300,height: 30.h),
              ItemInfoJob(title: StringsEn.contacted, subTitle: '0'),
            ],
          ),
        ),
      ),
    );
  }
}
