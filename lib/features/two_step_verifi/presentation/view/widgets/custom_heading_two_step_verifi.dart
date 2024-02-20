import 'package:flutter/material.dart';

import '../../../../../../../../core/consts/style.dart';
import '../../../../../../../../core/widgets/title_field.dart';

class CustomHeadingTwoStepVerifi extends StatelessWidget {
  const CustomHeadingTwoStepVerifi({
    super.key,
    required this.head,
    required this.subHead,
  });

  final String head;
  final String subHead;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //heading
        TitleField(label: head),
        //sub heading
        const AspectRatio(aspectRatio: AppConsts.aspect300on1),
        Text(
          subHead,
          style: AppConsts.styleHint14.copyWith(
            color: AppConsts.neutral500,
          ),
        ),
      ],
    );
  }
}
