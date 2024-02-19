import 'package:flutter/material.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/widgets/edit_profile_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: EditProfileBody(),
      ),
    );
  }
}
