import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/indicator_widget.dart';
import 'package:jobsque/features/onBoarding/presentation/view/widgets/board_structure.dart';

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
          children: [
            BoardStructure(
              image: AppAssets.board1,
              subTitle: StringsEn.subTitleBoard1,
              titles: [
                TextSpan(text: StringsEn.titleBoard1),
                TextSpan(
                  text: StringsEn.titleBoard11,
                  style: TextStyle(color: AppConsts.primary500),
                ),
                TextSpan(text: StringsEn.titleBoard111),
              ],
            ),
            BoardStructure(
              image: AppAssets.board2,
              titles: [
                TextSpan(text: StringsEn.titleBoard2),
                TextSpan(
                  text: StringsEn.titleBoard22,
                  style: TextStyle(color: AppConsts.primary500),
                ),
              ],
              subTitle: StringsEn.subTitleBoard2,
            ),
            BoardStructure(
              image: AppAssets.board3,
              titles: [
                TextSpan(text: StringsEn.titleBoard3),
                TextSpan(
                  text: StringsEn.titleBoard33,
                  style: TextStyle(color: AppConsts.primary500),
                ),
                TextSpan(text: StringsEn.titleBoard333),
              ],
              subTitle: StringsEn.subTitleBoard3,
            ),
          ],
        ),

        ///appbar
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppAssets.logo, height: size.height * .02),

              ///skip
              TextButton(
                onPressed: () => GoRouter.of(context).pushReplacement(authPath),
                child: Text(StringsEn.skip, style: AppConsts.style16),
              ),
            ],
          ),
        ),

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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio:AppConsts.aspectRatioButtonAuth.sp,
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
            ),
          ),
        ),
      ],
    );
  }
}
