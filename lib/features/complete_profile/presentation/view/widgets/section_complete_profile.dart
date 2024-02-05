import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/complete_profile/presentation/view/widgets/item_complete_profile.dart';

import 'custom_vertical_divider.dart';

class SectionCompleteProfile extends StatelessWidget {
  const SectionCompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //personalDetails
        ItemCompleteProfile(
          title: StringsEn.personalDetails,
          subTitle: StringsEn.fullNameEmail,
          complete: true,
          onTap: () => GoRouter.of(context).push(
            completeProfileProcessPath,
            extra: StringsEn.personalDetails,
          ),
        ),
        CustomVerticalDivider(color: AppConsts.primary500),
        //education
        ItemCompleteProfile(
          title: StringsEn.education,
          subTitle: StringsEn.enterEduca,
          complete: false,
          onTap: () => GoRouter.of(context).push(
            completeProfileProcessPath,
            extra: StringsEn.education,
          ),
        ),
        CustomVerticalDivider(color: AppConsts.neutral300),
        //experience
        ItemCompleteProfile(
          title: StringsEn.experience,
          subTitle: StringsEn.enterYourWorkExperience,
          complete: false,
          onTap: () => GoRouter.of(context).push(
            completeProfileProcessPath,
            extra: StringsEn.experience,
          ),
        ),
        CustomVerticalDivider(color: AppConsts.neutral300),
        //portfolio
        ItemCompleteProfile(
          title: StringsEn.portfolio,
          subTitle: StringsEn.createPortfolio,
          complete: false,
          onTap: () => GoRouter.of(context).push(
            completeProfileProcessPath,
            extra: StringsEn.portfolio,
          ),
        ),
      ],
    );
  }
}
