import 'package:flutter/material.dart';
import 'package:jobsque/core/widgets/or_sign_up_with_account_widget.dart';
import 'package:jobsque/features/auth/presentation/view/widgets/sign_with_google_and_facebook.dart';

import '../../../../../core/consts/enums.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';

class AuthWithSocial extends StatelessWidget {
  const AuthWithSocial({
    super.key,
    required AuthMode authMode,
  }) : _authMode = authMode;

  final AuthMode _authMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///or sign up with account
        OrSignUpOrSignInWithAccountWidget(
          label: _authMode == AuthMode.Login
              ? StringsEn.orLoginWithAccount
              : StringsEn.orSignUp,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect40on1),
        const SignWithGoogleAndFaceBookWidget(),
      ],
    );
  }
}
