import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';

class TypeJopComponent extends StatelessWidget {
  const TypeJopComponent({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.sp),
          color: color == AppConsts.neutral100
              ? AppConsts.primary100.withOpacity(.2)
              : AppConsts.primary100,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              label,
              style: AppConsts.styleHint14.copyWith(
                color: color,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
