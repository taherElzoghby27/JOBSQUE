import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/complete_profile/presentation/view/widgets/item_complete_profile.dart';

import 'custom_vertical_divider.dart';

class SectionCompleteProfile extends StatelessWidget {
  const SectionCompleteProfile({
    super.key,
    required this.personalDetails,
    required this.education,
    required this.experience,
    required this.portfolio,
  });

  final bool personalDetails;
  final bool education;
  final bool experience;
  final bool portfolio;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //personalDetails
        ItemCompleteProfile(
          title: StringsEn.personalDetails,
          subTitle: StringsEn.fullNameEmail,
          complete: personalDetails,
          onTap: () => GoRouter.of(context).push(
            completeProfileProcessPath,
            extra: StringsEn.personalDetails,
          ),
        ),
        CustomVerticalDivider(
          color: personalDetails ? AppConsts.primary500 : AppConsts.neutral300,
        ),
        //education
        ItemCompleteProfile(
          title: StringsEn.education,
          subTitle: StringsEn.enterEduca,
          complete: education,
          onTap: () => GoRouter.of(context).push(
            completeProfileProcessPath,
            extra: StringsEn.education,
          ),
        ),
        CustomVerticalDivider(
          color: education ? AppConsts.primary500 : AppConsts.neutral300,
        ),
        //experience
        ItemCompleteProfile(
          title: StringsEn.experience,
          subTitle: StringsEn.enterYourWorkExperience,
          complete: experience,
          onTap: () => GoRouter.of(context).push(
            completeProfileProcessPath,
            extra: StringsEn.experience,
          ),
        ),
        CustomVerticalDivider(
          color: experience ? AppConsts.primary500 : AppConsts.neutral300,
        ),
        //portfolio
        ItemCompleteProfile(
          title: StringsEn.portfolio,
          subTitle: StringsEn.createPortfolio,
          complete: portfolio,
          onTap: () => GoRouter.of(context).push(
            completeProfileProcessPath,
            extra: StringsEn.portfolio,
          ),
        ),
      ],
    );
  }
}
