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
    return CircleAvatar(
      radius: size.height * .0325.h,
      child: Container(
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
      ),
    );
  }
}
