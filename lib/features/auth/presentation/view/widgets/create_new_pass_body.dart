import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/text_form_field.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/auth_top_section.dart';

class CreatePassBody extends StatelessWidget {
  const CreatePassBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Form(
        //key: _formKey,
        child: ListView(
          children: [
            ///top section
            AuthTopSection(
              title: StringsEn.createNewPassword,
              subTitle: StringsEn.setYourNewPass,
              widget: IconButton(
                onPressed: () => GoRouter.of(context).pushReplacement(authPath),
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),

            ///Password
            CustomTextFormField(
              perfixIcon: Image.asset(AppAssets.lock),
              hint: StringsEn.password,
              suffixIcon: Icon(Icons.visibility),
            ),

            ///hint
            Text(
              StringsEn.passwordLeast8Cha,
              style: AppConsts.style16.copyWith(color: AppConsts.neutral400),
            ),
            SizedBox(height: size.height * .05.h),

            ///Password
            CustomTextFormField(
              perfixIcon: Image.asset(AppAssets.lock),
              hint: StringsEn.password,
              suffixIcon: Icon(Icons.visibility),
              obscureText: true,
            ),

            ///hint
            Text(
              StringsEn.bothPassMustMatch,
              style: AppConsts.style16.copyWith(color: AppConsts.neutral400),
            ),
            SizedBox(height: size.height * .3.h),

            ///Create account or login or reset pass
            SizedBox(
              height: size.height * .055.h,
              width: size.width * .9.w,
              child: CustomButton(
                text: StringsEn.resetPass,
                onTap: () => GoRouter.of(context).pushReplacement(
                  successfullyPagePath,
                  extra: {
                    StringsEn.icon: AppAssets.passSuccess,
                    StringsEn.title: StringsEn.passChangeSuccess,
                    StringsEn.subTitle: StringsEn.yourPassChanged,
                    StringsEn.labelButton: StringsEn.openEmailApp,
                    StringsEn.path: createPassPath,
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
