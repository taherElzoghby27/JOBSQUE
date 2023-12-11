import 'package:flutter/material.dart';
import 'package:jobsque/features/profile/presentation/view/notification/presentation/view/widgets/notification_profile_body.dart';

class NotificationProfileView extends StatelessWidget {
  const NotificationProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationProfileBody(),
      ),
    );
  }
}
