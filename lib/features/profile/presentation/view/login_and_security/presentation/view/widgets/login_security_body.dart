import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/widgets/section_account_access.dart';

import '../../../../../../../../core/consts/strings.dart';

class LoginSecurityBody extends StatelessWidget {
  const LoginSecurityBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * .02.h),
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pop(),
          title: StringsEn.loginAndSeurity,
          trailingWidget: Container(),
        ),
        SizedBox(height: size.height * .01.h),
        //Accont access
        SectionAccountAccess(),
      ],
    );
  }
}
