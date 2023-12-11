import 'package:flutter/material.dart';

import 'widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ProfileBody(),
      ),
    );
  }
}
