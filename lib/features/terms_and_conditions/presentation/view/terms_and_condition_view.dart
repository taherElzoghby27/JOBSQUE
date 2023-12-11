import 'package:flutter/material.dart';

import 'widgets/terms_and_condition_body.dart';

class TermsAndConditionView extends StatelessWidget {
  const TermsAndConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TermsAndConditionBody(),
      ),
    );
  }
}
