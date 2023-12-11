import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';

class TopSectionTitle extends StatelessWidget {
  const TopSectionTitle({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ///What type of work are you interested in?
        Text(
          title,
          style: AppConsts.style24,
        ),
        SizedBox(height: size.height * .02.h),

        ///Tell us what you’re interested in so we can customise the app for your needs.
        Text(
          subTitle,
          style: AppConsts.style16,
        ),
      ],
    );
  }
}
