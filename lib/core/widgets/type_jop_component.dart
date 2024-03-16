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
      padding: AppConsts.allPadding8,
      child: Container(
        decoration: BoxDecoration(
          borderRadius:AppConsts.radius25,
          color: color == AppConsts.neutral100
              ? AppConsts.primary100.withOpacity(.2)
              : AppConsts.primary100,
        ),
        child: Padding(
          padding: AppConsts.allPadding8,
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
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
