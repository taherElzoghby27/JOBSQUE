import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/style.dart';

class AuthTopSection extends StatelessWidget {
  const AuthTopSection({
    super.key,
    required this.title,
    required this.subTitle,
    required this.widget,
  });

  final String title;
  final String subTitle;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),

        ///logo
        Padding(
          padding: AppConsts.mainPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget,
              Image.asset(AppAssets.logo, scale: 1.5.sp),
            ],
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),

        ///create account title
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppConsts.style28.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspect40on1),

            ///create account sub title
            Text(subTitle, style: AppConsts.style16),
          ],
        ),

        const AspectRatio(aspectRatio: AppConsts.aspect16on2),
      ],
    );
  }
}
