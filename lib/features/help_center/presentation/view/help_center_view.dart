import 'package:flutter/material.dart';
import 'package:jobsque/features/help_center/presentation/view/widgets/help_center_body.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HelpCenterBody(),
      ),
    );
  }
}
