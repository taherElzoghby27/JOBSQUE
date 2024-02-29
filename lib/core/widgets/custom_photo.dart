import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

import '../helper/handle_image.dart';

class CustomPhoto extends StatelessWidget {
  const CustomPhoto({super.key, this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppConsts.radius15,
      child: HandleImageWidget(image:image!),
    );
  }
}
