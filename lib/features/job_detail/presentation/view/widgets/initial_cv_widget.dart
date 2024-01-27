import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';

class InitialCvWidget extends StatelessWidget {
  const InitialCvWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * .15.h),
        Text(
          StringsEn.noCvs,
          style: AppConsts.style16,
        ),
      ],
    );
  }
}
