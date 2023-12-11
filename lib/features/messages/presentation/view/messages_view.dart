import 'package:flutter/material.dart';
import 'package:jobsque/features/messages/presentation/view/widgets/messages_body.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MessagesBody(),
      ),
    );
  }
}
