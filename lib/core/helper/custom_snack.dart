import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';

showSnack(
  BuildContext context, {
  required String message,
  Color background = AppConsts.success400,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 2,
      backgroundColor: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.sp),
      ),
      content: Text(message),
      duration: Duration(seconds: 1),
    ),
  );
}
