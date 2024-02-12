import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/style.dart';

class ErrorWidg extends StatelessWidget {
  const ErrorWidg({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(aspectRatio: AppConsts.aspect16on4),
        AspectRatio(
          aspectRatio: AppConsts.aspect13on9,
          child: SvgPicture.asset(AppAssets.error),
        ),
        Text(
          message,
          style: AppConsts.style16Error,
        ),
      ],
    );
  }
}
