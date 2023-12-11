import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_divider.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/widgets/custom_tile.dart';

class SectionAccountAccess extends StatelessWidget {
  const SectionAccountAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TileWidget(label: StringsEn.accoutAccess),
        SizedBox(height: 10.h),
        //
        CustomTile(
          label: StringsEn.emailAddress,
          hintTrailing: 'tataamen@gmail.com',
          onTap: () => GoRouter.of(context).push(
            loginSecurityAuthPath,
            extra: StringsEn.emailAddress,
          ),
        ),
        CustomDivider(),
        CustomTile(
          label: StringsEn.phoneNumber,
          onTap: () => GoRouter.of(context).push(
            loginSecurityAuthPath,
            extra: StringsEn.phoneNumber,
          ),
        ),
        CustomDivider(),
        CustomTile(
          label: StringsEn.changePassword,
          onTap: () => GoRouter.of(context).push(
            loginSecurityAuthPath,
            extra: StringsEn.changePassword,
          ),
        ),
        CustomDivider(),
        CustomTile(
          label: StringsEn.twoStepVerifi,
          hintTrailing: StringsEn.nonActive,
          onTap: () => GoRouter.of(context).push(twoStepVerifiPath),
        ),
        CustomDivider(),
        CustomTile(
          label: StringsEn.faceId,
          onTap: () => GoRouter.of(context).push(
            loginSecurityAuthPath,
            extra: StringsEn.faceId,
          ),
        ),
        CustomDivider(),
      ],
    );
  }
}
