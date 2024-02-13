import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/component_empty.dart';

class CustomFadingProfile extends StatelessWidget {
  const CustomFadingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        AspectRatio(
          aspectRatio: AppConsts.aspect13on9,
          child: Stack(
            children: [
              //background
              AspectRatio(
                aspectRatio: AppConsts.aspect16on7,
                child: Container(color: AppConsts.neutral200),
              ),

              //info
              Positioned(
                top: size.height * .135.h,
                width: size.width,
                child: CircleAvatar(
                  radius: size.height * .045.h,
                  backgroundColor: AppConsts.neutral400,
                ),
              ),
            ],
          ),
        ),

        //about
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              ComponentEmpty(height: size.height * .02.h),
              SizedBox(height: size.height * .01.h),
              ComponentEmpty(height: size.height * .02.h),
              SizedBox(height: size.height * .01.h),
              ComponentEmpty(height: size.height * .02.h),
              SizedBox(height: size.height * .01.h),
              ComponentEmpty(height: size.height * .02.h),
            ],
          ),
        ),
      ],
    );
  }
}
