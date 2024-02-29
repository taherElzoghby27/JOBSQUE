import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/enums.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';

class AlternativeAuth extends StatelessWidget {
  const AlternativeAuth({
    super.key,
    required this.authMode,
    required this.action,
  });

  final AuthMode authMode;
  final void Function() action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          authMode == AuthMode.ResetPassword
              ? StringsEn.youRemeberYourPassword
              : authMode == AuthMode.Login
                  ? StringsEn.dontHaveAccount
                  : StringsEn.alreadyHaveAccount,
          style: AppConsts.style14,
        ),
        TextButton(
          onPressed: action,
          child: Text(
            authMode == AuthMode.Login && authMode != AuthMode.ResetPassword
                ? StringsEn.register
                : StringsEn.login,
            style: AppConsts.style14.copyWith(
              color: AppConsts.primary500,
            ),
          ),
        ),
      ],
    );
  }
}
