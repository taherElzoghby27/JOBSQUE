import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_button_three_widget.dart';
import 'package:jobsque/core/widgets/custom_circle_button.dart';
import 'package:jobsque/core/widgets/custom_divider.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';

class SectionGeneral extends StatelessWidget {
  const SectionGeneral({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        TileWidget(label: StringsEn.general),
        SizedBox(height: size.height * .01.h),
        //edit profile
        CustomButtonThreeWidget(
          leading: CustomCircleButton(
            icon: AppAssets.profileSvg,
            color: AppConsts.primary100,
          ),
          title: StringsEn.editProfile,
          trailing: Icons.arrow_forward_outlined,
          onTap: () => GoRouter.of(context).push(editProfilePath),
          decoration: BoxDecoration(),
        ),
        CustomDivider(),
        // portfolio
        CustomButtonThreeWidget(
          leading: CustomCircleButton(
            icon: AppAssets.portfolio,
            color: AppConsts.primary100,
          ),
          title: StringsEn.portfolio,
          trailing: Icons.arrow_forward_outlined,
          onTap: () => GoRouter.of(context).push(portfolioPath),
          decoration: BoxDecoration(),
        ),
        CustomDivider(),
        // Language
        CustomButtonThreeWidget(
          leading: CustomCircleButton(
            icon: AppAssets.global,
            color: AppConsts.primary100,
          ),
          title: StringsEn.language,
          trailing: Icons.arrow_forward_outlined,
          onTap: () => GoRouter.of(context).push(languagePath),
          decoration: BoxDecoration(),
        ),
        CustomDivider(),
        //Notification
        CustomButtonThreeWidget(
          leading: CustomCircleButton(
            icon: AppAssets.notification,
            color: AppConsts.primary100,
            colorIcon: AppConsts.primary500,
          ),
          title: StringsEn.notification,
          trailing: Icons.arrow_forward_outlined,
          onTap: () => GoRouter.of(context).push(notificationProfilePath),
          decoration: BoxDecoration(),
        ),
        CustomDivider(),
        //Login and security
        CustomButtonThreeWidget(
          leading: CustomCircleButton(
            icon: AppAssets.lockSvg,
            color: AppConsts.primary100,
          ),
          title: StringsEn.loginAndSeurity,
          trailing: Icons.arrow_forward_outlined,
          onTap: () => GoRouter.of(context).push(loginSecurityPath),
          decoration: BoxDecoration(),
        ),
        CustomDivider(),
        // complete profile
        CustomButtonThreeWidget(
          leading: CustomCircleButton(
            icon: AppAssets.profileSvg,
            color: AppConsts.primary100,
          ),
          title: StringsEn.completeProfile,
          trailing: Icons.arrow_forward_outlined,
          onTap: () => GoRouter.of(context).push(completeProfilePath),
          decoration: BoxDecoration(),
        ),
        CustomDivider(),
      ],
    );
  }
}
