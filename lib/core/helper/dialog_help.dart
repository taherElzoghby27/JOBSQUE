import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

Future<dynamic> customDialog({
  required String title,
  required String subTitle,
  required BuildContext context,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppConsts.neutral100,
        title: Text(
          title,
          style: AppConsts.style20.copyWith(color: AppConsts.success500),
        ),
        content: Text(
          subTitle,
          style: AppConsts.style12.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    },
  );
}
