import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.background = AppConsts.primary500,
    this.isBorder = false,
    this.styleText = AppConsts.style16White,
  });

  final String text;
  final Color background;
  final bool isBorder;
  final Function()? onTap;
  final TextStyle styleText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          background,
        ),
        overlayColor: MaterialStateProperty.all(AppConsts.primary200),
        shadowColor: MaterialStateProperty.all(AppConsts.primary500),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: AppConsts.radius25,
          ),
        ),
      ),
      child: FittedBox(
        child: Text(text, style: styleText),
      ),
    );
  }
}
