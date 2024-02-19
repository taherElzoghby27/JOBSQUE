import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_image.dart';

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.image,
    required this.name,
    required this.titleJob,
  });

  final String image;
  final String name;
  final String titleJob;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //photo
        CustomImage(image: image),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        //name
        Text(
          name,
          style: AppConsts.style20.copyWith(
            color: AppConsts.neutral900,
          ),
        ),
        //title Job
        Padding(
          padding: AppConsts.mainPadding,
          child: Text(
            titleJob,
            style: AppConsts.style16.copyWith(fontSize: 14),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
