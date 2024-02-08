import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';

class ContentTermsCond extends StatelessWidget {
  const ContentTermsCond({
    super.key,
    required this.heading,
    required this.subHeading,
  });

  final String heading;
  final String subHeading;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: AppConsts.style20.copyWith(color: AppConsts.neutral900),
        ),
        SizedBox(height: size.height * .01.h),
        Text(
          subHeading,
          style: AppConsts.style16.copyWith(fontSize: 14),
        ),
        const AspectRatio(aspectRatio:AppConsts.aspect16on1),
      ],
    );
  }
}
