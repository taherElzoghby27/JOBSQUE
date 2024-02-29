import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: AspectRatio(
        aspectRatio: AppConsts.aspect300on1,
        child: Container(color: AppConsts.neutral300),
      ),
    );
  }
}
