import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/auth/presentation/view/widgets/remeber_me.dart';

import '../../../../../core/consts/assets.dart';
import '../../../../../core/consts/enums.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/helper/handle_image.dart';
import '../../../../../core/widgets/text_form_field.dart';
import 'custom_text_field_password.dart';

class FieldsAuth extends StatefulWidget {
  FieldsAuth({
    super.key,
    required this.authMode,
    required this.userNameChange,
    required this.emailChange,
    required this.passwordChange,
    required this.onTapForgetPassword,
  });

  AuthMode authMode;
  void Function(String?) userNameChange;
  void Function(String?) emailChange;
  void Function(String?) passwordChange;
  void Function() onTapForgetPassword;

  @override
  State<FieldsAuth> createState() => _FieldsAuthState();
}

class _FieldsAuthState extends State<FieldsAuth> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///username
        widget.authMode == AuthMode.ResetPassword
            ? Container()
            : widget.authMode == AuthMode.Login
                ? Container()
                : CustomTextFormField(
                    perfixIcon: HandleImageWidget(
                      image: AppAssets.profile,
                    ),
                    hint: StringsEn.userName,
                    onChanged: widget.userNameChange,
                  ),
        const AspectRatio(
          aspectRatio: AppConsts.aspect40on1,
        ),

        ///Email

        CustomTextFormField(
          perfixIcon: HandleImageWidget(
            image: AppAssets.sms,
          ),
          hint: StringsEn.email,
          onChanged: widget.emailChange,
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspect40on1,
        ),

        ///Password
        widget.authMode == AuthMode.ResetPassword
            ? Container()
            : CustomTextFieldPassword(
                onChanged: widget.passwordChange,
              ),
        widget.authMode == AuthMode.Login
            ?

        ///remember me
            RemeberWidget(onTap: widget.onTapForgetPassword)
            : Container(),
      ],
    );
  }
}
