import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class CustomTypeJopWidget extends StatelessWidget {
  const CustomTypeJopWidget({
    super.key,
    required this.label,
    required this.labelColor,
    required this.onTap,
  });

  final String label;
  final Color labelColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: FittedBox(
        child: Container(
          decoration: BoxDecoration(
            color: labelColor == AppConsts.neutral500
                ? AppConsts.neutral100
                : labelColor.withOpacity(.3),
            borderRadius: AppConsts.radius25,
            border: Border.all(color: labelColor),
          ),
          child: Center(
            child: Padding(
              padding: AppConsts.padding10h8v,
              child: Text(
                label,
                style: AppConsts.style16.copyWith(
                  fontSize: 12,
                  color: labelColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
