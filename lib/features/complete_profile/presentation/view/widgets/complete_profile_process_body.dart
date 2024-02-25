import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';

import 'custom_education_component.dart';
import 'custom_experience_component.dart';
import 'custom_personal_details_component.dart';
import 'custom_portfolio_component.dart';

class CompleteProfileProcessBody extends StatelessWidget {
  const CompleteProfileProcessBody({super.key, required this.currentPage});

  final String currentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

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
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          currentPage == StringsEn.personalDetails
              ? const CustomPersonalDetailsComponent()
              : currentPage == StringsEn.education
                  ? const CustomEducationComponent()
                  : currentPage == StringsEn.experience
                      ? const CustomExperienceComponent()
                      : const CustomPortfolioComponent(),
        ],
      ),
    );
  }
}
