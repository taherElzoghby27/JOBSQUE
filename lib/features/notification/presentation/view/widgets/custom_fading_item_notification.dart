import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/component_empty.dart';

class CustomFadingItemNotification extends StatelessWidget {
  const CustomFadingItemNotification({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: size.height * .035.h,
          backgroundColor: AppConsts.neutral400,
        ),
        SizedBox(width: size.width * .02.w),

        Expanded(
          child: Column(
            children: [
              ComponentEmpty(height: size.height * .02.h),
              SizedBox(height: size.height * .01.w),
              ComponentEmpty(height: size.height * .02.h),
            ],
          ),
        ),
      ],
    );
  }
}
