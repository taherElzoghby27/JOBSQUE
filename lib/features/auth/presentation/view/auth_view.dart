import 'package:flutter/material.dart';
import 'package:jobsque/features/auth/presentation/view/widgets/auth_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AuthBody(),
      ),
    );
  }
}
