import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/consts/style.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  final String icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspect16on4),
        //icon
        SvgPicture.asset(
          icon,
          fit: BoxFit.fill,
          height: size.height * .15.h,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        //title
        Text(
          title,
          style: AppConsts.style24,
          textAlign: TextAlign.center,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect40on1),
        //sub title
        SizedBox(
          width: size.width * .7.w,
          child: Text(
            subTitle,
            style: AppConsts.style16,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
