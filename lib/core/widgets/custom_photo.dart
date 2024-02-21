import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/handle_image.dart';

class CustomPhoto extends StatelessWidget {
  const CustomPhoto({super.key, this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.sp),
      child: HandleImageWidget(image:image!),
    );
  }
}
