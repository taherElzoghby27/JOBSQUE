import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_button_three_widget.dart';
import 'package:jobsque/core/widgets/custom_divider.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';

class SectionOthers extends StatelessWidget {
  const SectionOthers({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        TileWidget(label: StringsEn.others),
        SizedBox(height: size.height * .01.h),
        //accesibility
        CustomButtonThreeWidget(
          title: StringsEn.accesibility,
          trailing: Icons.arrow_forward_outlined,
          onTap: () {},
          decoration: BoxDecoration(),
        ),
        CustomDivider(),
        // help center
        CustomButtonThreeWidget(
          title: StringsEn.helpCenter,
          trailing: Icons.arrow_forward_outlined,
          onTap: () => GoRouter.of(context).push(helpCenterPath),
          decoration: BoxDecoration(),
        ),
        CustomDivider(),
        // term & conditions
        CustomButtonThreeWidget(
          title: StringsEn.termsCondition,
          trailing: Icons.arrow_forward_outlined,
          onTap: () => GoRouter.of(context).push(termConditionPath),
          decoration: BoxDecoration(),
        ),
        CustomDivider(),
        //privacy
        CustomButtonThreeWidget(
          title: StringsEn.privacyPolicy,
          trailing: Icons.arrow_forward_outlined,
          onTap: () => GoRouter.of(context).push(privacyPath),
          decoration: BoxDecoration(),
        ),
        CustomDivider(),
      ],
    );
  }
}
