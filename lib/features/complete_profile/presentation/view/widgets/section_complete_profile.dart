import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/features/complete_profile/data/models/complete_profile_model.dart';

import '../../../../../core/consts/routesPage.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import 'custom_vertical_divider.dart';
import 'item_complete_profile.dart';

class SectionCompleteProfile extends StatelessWidget {
  const SectionCompleteProfile({
    super.key,
    required this.completeProfileModel,
  });

  final CompleteProfileModel completeProfileModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //personalDetails
        ItemCompleteProfile(
          title: StringsEn.personalDetails,
          subTitle: StringsEn.fullNameEmail,
          complete: completeProfileModel.personalDetailsStatus,
          onTap: !completeProfileModel.personalDetailsStatus
              ? () => GoRouter.of(context).push(
                    completeProfileProcessPath,
                    extra: StringsEn.personalDetails,
                  )
              : () {},
        ),
        CustomVerticalDivider(
          color: completeProfileModel.personalDetailsStatus
              ? AppConsts.primary500
              : AppConsts.neutral300,
        ),
        //education
        ItemCompleteProfile(
          title: StringsEn.education,
          subTitle: StringsEn.enterEduca,
          complete: completeProfileModel.educationStatus,
          onTap: !completeProfileModel.educationStatus
              ? () => GoRouter.of(context).push(
                    completeProfileProcessPath,
                    extra: StringsEn.education,
                  )
              : () {},
        ),
        CustomVerticalDivider(
          color: completeProfileModel.educationStatus
              ? AppConsts.primary500
              : AppConsts.neutral300,
        ),
        //experience
        ItemCompleteProfile(
          title: StringsEn.experience,
          subTitle: StringsEn.enterYourWorkExperience,
          complete: completeProfileModel.experienceStatus,
          onTap: !completeProfileModel.experienceStatus
              ? () => GoRouter.of(context).push(
                    completeProfileProcessPath,
                    extra: StringsEn.experience,
                  )
              : () {},
        ),
        CustomVerticalDivider(
          color: completeProfileModel.experienceStatus
              ? AppConsts.primary500
              : AppConsts.neutral300,
        ),
        //portfolio
        ItemCompleteProfile(
          title: StringsEn.portfolio,
          subTitle: StringsEn.createPortfolio,
          complete: completeProfileModel.portfolioStatus,
          onTap: !completeProfileModel.portfolioStatus
              ? () => GoRouter.of(context).push(
                    completeProfileProcessPath,
                    extra: StringsEn.portfolio,
                  )
              : () {},
        ),
      ],
    );
  }
}
