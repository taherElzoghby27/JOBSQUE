import 'package:flutter/material.dart';

import 'widgets/interested_in_work_body.dart';

class InteresetedInWorkView extends StatelessWidget {
  const InteresetedInWorkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InterestedInWorkBody(),
      ),
    );
  }
}
