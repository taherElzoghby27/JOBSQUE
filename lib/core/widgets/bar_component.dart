import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';

class BarComponent extends StatelessWidget {
  const BarComponent({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
  });

  final String title;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(40.sp),
          ),
          child: Center(
            child: Text(
              title,
              style: AppConsts.style14.copyWith(
                color: color == AppConsts.neutral200
                    ? AppConsts.neutral500
                    : AppConsts.neutral100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
