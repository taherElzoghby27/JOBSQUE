import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SectionPercentIndicator extends StatelessWidget {
  const SectionPercentIndicator({super.key, required this.nOfManyTrue});

  final int nOfManyTrue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 7.0,
            percent: nOfManyTrue/4,
            center: Text(
              calcPercentage,
              style: AppConsts.style24.copyWith(color: AppConsts.primary500),
            ),
            progressColor: AppConsts.primary500,
          ),
          SizedBox(height: size.height * .02.h),
          Text(
            showStatus,
            style: AppConsts.style16White.copyWith(
              color: AppConsts.primary500,
            ),
          ),
          SizedBox(height: size.height * .02.h),
          Text(StringsEn.completeYourProfile, style: AppConsts.style16),
          SizedBox(height: size.height * .02.h),
        ],
      ),
    );
  }

  String get calcPercentage => "${((nOfManyTrue / 4) * 100).toInt()}%";

  String get showStatus => nOfManyTrue != 4
      ? ("${nOfManyTrue}/4 ${StringsEn.completed}")
      : "${StringsEn.completed}!";
}
