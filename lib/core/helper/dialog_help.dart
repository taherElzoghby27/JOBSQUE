import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/customButton.dart';

Future<dynamic> customDialog({
  required String title,
  String? subTitle,
  required BuildContext context,
  void Function()? onTapSuccess,
  void Function()? onTapCancel,
  bool readOnly = false,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppConsts.white,
        title: Text(
          title,
          style: AppConsts.style20.copyWith(color: AppConsts.neutral800),
        ),
        content: Text(
          subTitle ?? '',
          style: AppConsts.style12.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: readOnly
            ? []
            : [
                CustomButton(
                  text: StringsEn.yes,
                  onTap: onTapSuccess,
                  background: AppConsts.success500,
                ),
                CustomButton(
                  text: StringsEn.no,
                  onTap: onTapCancel,
                  background: AppConsts.danger500,
                ),
              ],
      );
    },
  );
}
