import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';

class BoardStructure extends StatelessWidget {
  const BoardStructure({
    super.key,
    required this.image,
    required this.subTitle,
    required this.titles,
  });

  final String image;
  final List<InlineSpan> titles;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          SizedBox(height: size.height * .1.h),
          Image.asset(image),
          SizedBox(height: size.height * .04.h),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                ///title
                Text.rich(
                  TextSpan(children: titles),
                  style: AppConsts.style32,
                ),

                ///sub title
                Text(
                  subTitle,
                  style: AppConsts.style16,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
