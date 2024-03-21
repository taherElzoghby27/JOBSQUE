import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/enums.dart';
import 'package:jobsque/core/consts/style.dart';

import 'alternative_auth.dart';
import 'auth_button_bloc_consumer.dart';
import 'auth_with_social.dart';

class SectionBottomAuth extends StatelessWidget {
  const SectionBottomAuth({
    super.key,
    required this.authMode,
    required this.actionSignInOrSignUp,
    required this.buttonAuth,
    required this.successAction,
  });

  final AuthMode authMode;
  final void Function() actionSignInOrSignUp;
  final void Function() successAction;
  final dynamic Function() buttonAuth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///already have an account
        AlternativeAuth(
          authMode: authMode,
          action: actionSignInOrSignUp,
        ),

        ///Create account or login or reset pass
        AuthButtonBlocConsumer(
          tapAuth: buttonAuth,
          authMode: authMode,
          successAction: successAction,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect40on1),
        authMode == AuthMode.ResetPassword
            ? Container()
            : AuthWithSocial(authMode: authMode),
        const AspectRatio(aspectRatio: AppConsts.aspect16on2),
      ],
    );
  }
}
