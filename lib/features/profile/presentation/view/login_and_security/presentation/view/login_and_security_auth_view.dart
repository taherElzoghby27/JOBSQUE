import 'package:flutter/material.dart';

import 'widgets/login_and_security_auth_body.dart';

class LoginSecurityAuthView extends StatelessWidget {
  const LoginSecurityAuthView({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoginSecurityAuthBody(path: path),
      ),
    );
  }
}
