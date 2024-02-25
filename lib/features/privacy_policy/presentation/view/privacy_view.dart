import 'package:flutter/material.dart';
import 'package:jobsque/features/privacy_policy/presentation/view/widgets/privacy_body.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: PrivacyBody(),
      ),
    );
  }
}
