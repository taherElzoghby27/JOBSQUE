import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //heading
        TitleField(label: head),
        //sub heading
        SizedBox(height: size.height * .01.w),
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
