import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class CustomTitleSubTitleWidget extends StatelessWidget {
  const CustomTitleSubTitleWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title
        Text(
          title,
          style: AppConsts.style20.copyWith(
            color: AppConsts.neutral900,
          ),
        ),
        //sub title
        Text(
          subTitle,
          style: AppConsts.style16.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
