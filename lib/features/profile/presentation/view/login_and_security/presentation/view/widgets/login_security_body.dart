import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/widgets/section_account_access.dart';

import '../../../../../../../../core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';

class LoginSecurityBody extends StatelessWidget {
  const LoginSecurityBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pop(),
          title: StringsEn.loginAndSeurity,
          trailingWidget: Container(),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        //Accont access
        const SectionAccountAccess(),
      ],
    );
  }
}
