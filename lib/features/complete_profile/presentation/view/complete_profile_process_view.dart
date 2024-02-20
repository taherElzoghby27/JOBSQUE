import 'package:flutter/material.dart';
import 'package:jobsque/features/complete_profile/presentation/view/widgets/complete_profile_process_body.dart';

class CompleteProfileProcessView extends StatelessWidget {
  const CompleteProfileProcessView({super.key, required this.currentPage});

  final String currentPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CompleteProfileProcessBody(
          currentPage: currentPage,
        ),
      ),
    );
  }
}
