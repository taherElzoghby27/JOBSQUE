import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';

class JopTypeComponent extends StatelessWidget {
  const JopTypeComponent({
    super.key,
    required this.type,
    required this.onTap,
    required this.color,
    required this.backColor,
  });

  final String type;
  final void Function() onTap;
  final Color color;
  final Color backColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: size.height * .045.h,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: backColor == AppConsts.primary900
                ? AppConsts.primary900
                : AppConsts.neutral300,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            children: [
              Text(
                type,
                style: AppConsts.style20.copyWith(
                  fontSize: 12,
                  color: color,
                ),
              ),
              Icon(
                Icons.expand_more,
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
