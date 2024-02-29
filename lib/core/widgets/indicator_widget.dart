import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/indicator.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Indicator(
          height: currentPage == index ? size.height * .012 : size.height * .01,
          color: currentPage == index
              ? AppConsts.primary500
              : AppConsts.primary200,
          width: currentPage == index ? size.width * .023 : size.width * .02,
        ),
      ),
    );
  }
}
