import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/widgets/change_pass_component.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/widgets/email_address_component.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/widgets/phone_number_component.dart';

import '../../../../../../../../core/consts/strings.dart';
import '../../../../../../../../core/widgets/small_loading_widget.dart';

class LoginSecurityAuthBody extends StatelessWidget {
  const LoginSecurityAuthBody({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * .02.h),
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pop(),
          title: path == StringsEn.emailAddress
              ? StringsEn.emailAddress
              : path == StringsEn.phoneNumber
                  ? StringsEn.phoneNumber
                  : StringsEn.changePassword,
          trailingWidget: Container(),
        ),

        path == StringsEn.emailAddress
            ? EmailAddressPage()
            : path == StringsEn.changePassword
                ? ChangePassComponent()
                : PhoneNumberComponent(),
        Spacer(),
        //button
        SizedBox(
          height: size.height * .055.h,
          width: size.width * .9.w,
          child: Visibility(
            visible: true,
            replacement: LoadingWidget(),
            child: CustomButton(
              text: StringsEn.save,
              onTap: () {},
            ),
          ),
        ),
        SizedBox(height: size.height * .035.w),
      ],
    );
  }
}
