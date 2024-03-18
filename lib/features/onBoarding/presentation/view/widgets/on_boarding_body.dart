import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/data.dart';
import 'package:jobsque/core/widgets/indicator_widget.dart';
import 'button_on_boarding.dart';
import 'custom_app_bar_on_boarding.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final PageController pageController = PageController();
  int currentPage = 0;

  ///dispose page controller
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ///page view
        PageView(
          controller: pageController,
          onPageChanged: (int index) => setState(
            () => currentPage = index,
          ),
          children: childrenPageViewOnBoarding,
        ),

        ///appbar
        const CustomAppBarOnBoarding(),

        ///indicator
        Positioned(
          width: size.width,
          bottom: size.height * .15.h,
          child: Align(
            alignment: Alignment.center,
            child: IndicatorWidget(currentPage: currentPage),
          ),
        ),

        ///next or get started
        Positioned(
          width: size.width,
          bottom: size.height * .07.h,
          child: Align(
            alignment: Alignment.center,
            child: ButtonOnBoarding(
              currentPage: currentPage,
              pageController: pageController,
            ),
          ),
        ),
      ],
    );
  }
}
