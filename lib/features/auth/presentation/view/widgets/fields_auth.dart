import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/auth/presentation/view/widgets/remeber_me.dart';

import '../../../../../core/consts/assets.dart';
import '../../../../../core/consts/enums.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/helper/handle_image.dart';
import '../../../../../core/widgets/text_form_field.dart';

class FieldsAuth extends StatefulWidget {
  FieldsAuth({
    super.key,
    required this.authMode,
    required this.userNameChange,
    required this.emailChange,
    required this.passwordChange,
  });

  AuthMode authMode;
  void Function(String?) userNameChange;
  void Function(String?) emailChange;
  void Function(String?) passwordChange;

  @override
  State<FieldsAuth> createState() => _FieldsAuthState();
}

class _FieldsAuthState extends State<FieldsAuth> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspect16on13,
      child: Column(
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
              : CustomTextFormField(
                  perfixIcon: HandleImageWidget(
                    image: AppAssets.lock,
                  ),
                  hint: StringsEn.password,
                  obscureText: true,
                  onChanged: widget.passwordChange,
                ),
          widget.authMode == AuthMode.Login
              ?

              ///remeber me
              RemeberWidget(
                  onTap: () => setState(
                    () => widget.authMode = AuthMode.ResetPassword,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
