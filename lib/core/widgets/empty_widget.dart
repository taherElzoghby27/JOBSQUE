import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/handle_image.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  final String icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspect16on4),
        //icon
        AspectRatio(
          aspectRatio: AppConsts.aspect16on5,
          child: HandleImageWidget(image: icon),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        //title
        Text(
          title,
          style: AppConsts.style24,
          textAlign: TextAlign.center,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect40on1),
        //sub title
        Padding(
          padding: AppConsts.passing25,
          child: Text(
            subTitle,
            style: AppConsts.style16,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
