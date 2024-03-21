import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/handle_image.dart';

class ErrorWid extends StatelessWidget {
  const ErrorWid({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * .1.h,
            child: HandleImageWidget(image: AppAssets.error),
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppConsts.style16Error.copyWith(
              color: AppConsts.neutral400,
            ),
          ),
        ],
      ),
    );
  }
}
