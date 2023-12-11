import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque/core/consts/style.dart';

class CircleDoneWidget extends StatelessWidget {
  const CircleDoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .055.h,
      width: size.width * .12.w,
      decoration: AppConsts.decorationCircleDone,
      child: Center(
        child: Icon(
          FontAwesomeIcons.check,
          color: AppConsts.neutral100,
        ),
      ),
    );
  }
}
