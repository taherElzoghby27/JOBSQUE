import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon({
    Key? key,
    required this.onTap,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final Widget label;

  final Widget icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppConsts.primary500),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              label,
            ],
          ),
        ),
      ),
    );
  }
}
