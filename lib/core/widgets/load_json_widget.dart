import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:lottie/lottie.dart';

class LoadJsonWidget extends StatelessWidget {
  const LoadJsonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        color: AppConsts.neutral300.withOpacity(.45),
        child: Center(
          child: Lottie.asset(
            AppAssets.loadJson,
            height: size.height * .075.h,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
