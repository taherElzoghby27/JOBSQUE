import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SectionPercentIndicator extends StatelessWidget {
  const SectionPercentIndicator({super.key});

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
            percent: .7,
            center: new Text(
              "75%",
              style: AppConsts.style24.copyWith(color: AppConsts.primary500),
            ),
            progressColor: AppConsts.primary500,
          ),
          SizedBox(height: size.height * .02.h),
          Text(
            '2/4 ${StringsEn.completed}',
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
}
