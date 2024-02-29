import 'package:flutter/material.dart';
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
    return Padding(
      padding: AppConsts.mainPadding,
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
                icon: Icon(Icons.arrow_back_ios),
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
            const AspectRatio(aspectRatio: AppConsts.aspect16on1),

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
            const AspectRatio(aspectRatio: AppConsts.aspect16on8),

            ///Create account or login or reset pass
            AspectRatio(
              aspectRatio: AppConsts.aspectRatioButtonAuth,
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
            const AspectRatio(aspectRatio: AppConsts.aspect40on1),
          ],
        ),
      ),
    );
  }
}
