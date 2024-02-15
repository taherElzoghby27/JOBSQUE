import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/consts/style.dart';

class WorkTypeComponent extends StatelessWidget {
  const WorkTypeComponent({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String title;
  final String icon;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15.sp),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: AppConsts.aspect13on10,
          child: Container(
            decoration: BoxDecoration(
              color: color.withOpacity(.15),
              borderRadius: BorderRadius.circular(15.sp),
              border: Border.all(color: color),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Container(
                      decoration: BoxDecoration(
                        color: color == AppConsts.neutral300
                            ? AppConsts.neutral300.withOpacity(.5)
                            : AppConsts.neutral100,
                        borderRadius: BorderRadius.circular(25.sp),
                        border: Border.all(color: color),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          icon,
                          color: color == AppConsts.neutral300
                              ? AppConsts.neutral900
                              : AppConsts.primary500,
                        ),
                      ),
                    ),
                  ),
                  const AspectRatio(aspectRatio: AppConsts.aspect16on1),

                  ///title
                  Text(
                    title,
                    style: AppConsts.style16.copyWith(
                      color: AppConsts.neutral900,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
