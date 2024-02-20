import 'package:flutter/material.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view/widgets/two_step_verifi_body.dart';

class TwoStepVerView extends StatelessWidget {
  const TwoStepVerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: TwoStepVerBody(),
      ),
    );
  }
}
