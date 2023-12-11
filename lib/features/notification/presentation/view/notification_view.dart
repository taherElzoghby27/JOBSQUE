import 'package:flutter/material.dart';
import 'package:jobsque/features/notification/presentation/view/widgets/notification_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationBody(),
      ),
    );
  }
}
