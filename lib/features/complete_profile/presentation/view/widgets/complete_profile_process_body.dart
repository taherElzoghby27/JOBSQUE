import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';

import 'custom_education_component.dart';
import 'custom_experience_component.dart';
import 'custom_personal_details_component.dart';
import 'custom_portfolio_component.dart';

class CompleteProfileProcessBody extends StatelessWidget {
  const CompleteProfileProcessBody({
    super.key,
    required this.currentPage,
  });

  final String currentPage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ListView(
        children: [
          SizedBox(height: size.height * .02.h),

          //custom appBar
          CustomAppBar(
            leadingOnTap: () => GoRouter.of(context).pop(),
            title: currentPage == StringsEn.personalDetails
                ? StringsEn.personalDetails
                : currentPage == StringsEn.education
                    ? StringsEn.education
                    : currentPage == StringsEn.experience
                        ? StringsEn.experience
                        : StringsEn.portfolio,
            trailingWidget: Container(),
          ),
          SizedBox(height: size.height * .02.h),
          currentPage == StringsEn.personalDetails
              ? CustomPersonalDetailsComponent()
              : currentPage == StringsEn.education
                  ? CustomEducationComponent()
                  : currentPage == StringsEn.experience
                      ? CustomExperienceComponent()
                      : CustomPortfolioComponent(),
        ],
      ),
    );
  }
}
