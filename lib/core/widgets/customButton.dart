import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.background = AppConsts.primary500,
    this.isBorder = false,
    this.styleText = AppConsts.style16White,
  });

  final String text;
  final Color background;
  final bool isBorder;
  final Function() onTap;
  final TextStyle styleText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: MaterialStateProperty.all(AppConsts.primary200),
      borderRadius: AppConsts.radius25,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppConsts.radius25,
          boxShadow: AppConsts.buttonShadow,
        ),
        child: Center(
          child: Text(text, style: styleText),
        ),
      ),
    );
  }
}
