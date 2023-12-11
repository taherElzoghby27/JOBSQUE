import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .055.h,
      width: size.width * .12.w,
      decoration: color == AppConsts.primary500
          ? AppConsts.decorationCircleNotCheck.copyWith(
              border: Border.all(color: AppConsts.primary500),
            )
          : AppConsts.decorationCircleNotCheck,
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
