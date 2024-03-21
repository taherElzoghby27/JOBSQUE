import 'package:flutter/material.dart';

import 'widgets/interested_in_work_body.dart';

class InterestedInWorkView extends StatelessWidget {
  const InterestedInWorkView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: InterestedInWorkBody(),
      ),
    );
  }
}
