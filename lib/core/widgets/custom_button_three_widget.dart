import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class CustomButtonThreeWidget extends StatelessWidget {
  const CustomButtonThreeWidget({
    super.key,
    this.leading,
    required this.title,
    required this.trailing,
    required this.onTap,
    this.decoration,
  });

  final Widget? leading;
  final String title;
  final IconData trailing;
  final void Function() onTap;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: AppConsts.primary100,
      borderRadius: AppConsts.radius100,
      child: AspectRatio(
        aspectRatio: AppConsts.aspectRatioButtonAuth,
        child: Container(
          decoration: decoration ??
              AppConsts.borderButton.copyWith(
                borderRadius: AppConsts.radius100,
              ),
          child: Padding(
            padding: AppConsts.allPadding8,
            child: Row(
              children: [
                leading ?? Container(),
                Spacer(flex: 1),
                Text(
                  title,
                  style: AppConsts.style32.copyWith(fontSize: 16),
                ),
                Spacer(flex: 7),
                Icon(trailing, weight: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
