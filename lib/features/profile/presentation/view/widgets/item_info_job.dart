import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class ItemInfoJob extends StatelessWidget {
  const ItemInfoJob({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppConsts.style14.copyWith(
            color: AppConsts.neutral500,
          ),
        ),
        Text(
          subTitle,
          style: AppConsts.style20.copyWith(
            color: AppConsts.neutral900,
          ),
        ),
      ],
    );
  }
}
