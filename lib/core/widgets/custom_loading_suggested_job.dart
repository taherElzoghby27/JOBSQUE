import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';

class CustomLoadingSuggestedJob extends StatelessWidget {
  const CustomLoadingSuggestedJob({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: AspectRatio(
        aspectRatio: AppConsts.aspect13on9,
        child: Container(
          decoration: AppConsts.decorationNeutral300border16,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      width: size.width * .15.w,
                      height: size.height * .055.h,
                      decoration: AppConsts.decorationNeutral400border16,
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * .4.w,
                          height: size.height * .01.h,
                          decoration: AppConsts.decorationNeutral400border16,
                        ),
                        SizedBox(height: size.height * .01.h),
                        Container(
                          width: size.width * .4.w,
                          height: size.height * .01.h,
                          decoration: AppConsts.decorationNeutral400border16,
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: size.height * .03.h,
                          decoration: AppConsts.decorationNeutral400border16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: size.height * .03.h,
                          decoration: AppConsts.decorationNeutral400border16,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                //salary - apply jop
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height * .03.h,
                      width: size.width * .3.w,
                      decoration: AppConsts.decorationNeutral400border16,
                    ),
                    Container(
                      height: size.height * .045.h,
                      width: size.width * .28.w,
                      decoration: AppConsts.decorationNeutral400border16,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
