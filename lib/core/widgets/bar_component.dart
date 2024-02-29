import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class BarComponent extends StatelessWidget {
  const BarComponent({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
  });

  final String title;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:AppConsts.mainPadding,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: AppConsts.radius40,
          ),
          child: Center(
            child: Text(
              title,
              style: AppConsts.style14.copyWith(
                color: color == AppConsts.neutral200
                    ? AppConsts.neutral500
                    : AppConsts.neutral100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
