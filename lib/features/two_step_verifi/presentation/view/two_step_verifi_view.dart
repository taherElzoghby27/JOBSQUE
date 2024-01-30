import 'package:flutter/material.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view/widgets/two_step_verifi_body.dart';

class TwoStepVeriView extends StatelessWidget {
  const TwoStepVeriView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TwoStepVerifiBody(),
      ),
    );
  }
}
