import 'package:flutter/material.dart';
import 'package:jobsque/features/complete_profile/presentation/view/widgets/complete_profile_body.dart';

class CompleteProfileView extends StatelessWidget {
  const CompleteProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CompleteProfileBody(),
      ),
    );
  }
}
