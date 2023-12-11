import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/style.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ///1
          Container(
            height: size.height * .75.h,
            width: size.width.w,
            decoration: BoxDecoration(
              color: AppConsts.primary100.withOpacity(.1),
              borderRadius: BorderRadius.circular(200.sp),
            ),
          ),

          ///2
          Container(
            height: size.height * .6.h,
            width: size.width.w,
            decoration: BoxDecoration(
              color: AppConsts.primary100.withOpacity(.3),
              borderRadius: BorderRadius.circular(200.sp),
            ),
          ),

          ///3
          Container(
            height: size.height * .38.h,
            width: size.width * .81.w,
            decoration: BoxDecoration(
              color: AppConsts.primary100.withOpacity(.5),
              borderRadius: BorderRadius.circular(200.sp),
            ),
          ),

          ///4
          Container(
            height: size.height * .2.h,
            width: size.width * .5.w,
            decoration: BoxDecoration(
              color: AppConsts.primary100.withOpacity(.7),
              borderRadius: BorderRadius.circular(200.sp),
            ),
          ),

          ///logo
          Image.asset(AppAssets.logo),
        ],
      ),
    );
  }
}
