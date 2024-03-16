import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SectionPercentIndicator extends StatelessWidget {
  const SectionPercentIndicator({super.key, required this.nOfManyTrue});

  final int nOfManyTrue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 7.0,
            percent: nOfManyTrue / 4,
            center: Text(
              calcPercentage,
              style: AppConsts.style24.copyWith(color: AppConsts.primary500),
            ),
            progressColor: AppConsts.primary500,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          Text(
            showStatus,
            style: AppConsts.style16White.copyWith(
              color: AppConsts.primary500,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          Text(
            StringsEn.completeYourProfile,
            style: AppConsts.style16.copyWith(fontSize: 14),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        ],
      ),
    );
  }

  String get calcPercentage => "${((nOfManyTrue / 4) * 100).toInt()}%";

  String get showStatus => nOfManyTrue != 4
      ? ("${nOfManyTrue}/4 ${StringsEn.completed}")
      : "${StringsEn.completed}!";
}
