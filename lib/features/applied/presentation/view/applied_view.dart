import 'package:flutter/material.dart';
import 'package:jobsque/features/applied/presentation/view/widgets/applied_body.dart';

class AppliedView extends StatelessWidget {
  const AppliedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppliedBody(),
      ),
    );
  }
}
