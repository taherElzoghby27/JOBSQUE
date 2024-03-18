import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/customButton.dart';

class ButtonOnBoarding extends StatelessWidget {
  const ButtonOnBoarding({
    super.key,
    required this.currentPage,
    required this.pageController,
  });

  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.allPadding8,
      child: AspectRatio(
        aspectRatio: AppConsts.aspectRatioButtonAuth.sp,
        child: CustomButton(
          text: currentPage == 2 ? StringsEn.getStarted : StringsEn.next,
          onTap: () {
            if (currentPage == 0) {
              pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            } else if (currentPage == 1) {
              pageController.animateToPage(
                2,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            } else {
              GoRouter.of(context).pushReplacement(authPath);
            }
          },
        ),
      ),
    );
  }
}
