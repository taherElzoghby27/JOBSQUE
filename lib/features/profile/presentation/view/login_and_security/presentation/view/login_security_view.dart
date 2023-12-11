import 'package:flutter/material.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/widgets/login_security_body.dart';

class LoginSecurityView extends StatelessWidget {
  const LoginSecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoginSecurityBody(),
      ),
    );
  }
}
