import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';

class NotFoundSearch extends StatelessWidget {
  const NotFoundSearch({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: size.height * .2.h),
        SvgPicture.asset(AppAssets.notFoundSearch),
        const AspectRatio(aspectRatio:AppConsts.aspect16on1),
        Text(StringsEn.searchNotFound, style: AppConsts.style24),
        const AspectRatio(aspectRatio:AppConsts.aspect16on1),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            StringsEn.trySearchingWithDifferent,
            style: AppConsts.style16,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
