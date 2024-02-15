import 'package:flutter/material.dart';
import 'package:jobsque/features/auth/presentation/view/widgets/work_location_body.dart';

class WorkLocationView extends StatelessWidget {
  const WorkLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: WorkLocationBody(),
      ),
    );
  }
}
