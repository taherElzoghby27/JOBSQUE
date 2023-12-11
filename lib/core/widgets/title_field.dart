import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class TitleField extends StatelessWidget {
  const TitleField({
    super.key,
    this.label,
    this.star,
  });

  final String? label;
  final String? star;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label ?? '',
          style: AppConsts.style16White.copyWith(
            color: AppConsts.neutral900,
          ),
        ),
        Text(
          star ?? '',
          style: AppConsts.style16White.copyWith(
            color: AppConsts.danger500,
          ),
        ),
      ],
    );
  }
}
