import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/handle_image.dart';

class CustomPhoto extends StatelessWidget {
  const CustomPhoto({
    super.key,
    required this.height,
    required this.image,
  });

  final double height;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.sp),
      child: handleImage(image, height),
    );
  }
}
