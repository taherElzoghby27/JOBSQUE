import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class TopSectionTitle extends StatelessWidget {
  const TopSectionTitle({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///What type of work are you interested in?
        Text(
          title,
          style: AppConsts.style24,
        ),
        const AspectRatio(aspectRatio:AppConsts.aspect16on1),

        ///Tell us what you’re interested in so we can customise the app for your needs.
        Text(
          subTitle,
          style: AppConsts.style16,
        ),
      ],
    );
  }
}
