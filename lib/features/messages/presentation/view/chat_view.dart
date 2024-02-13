import 'package:flutter/material.dart';
import 'package:jobsque/features/messages/presentation/view/widgets/chat_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ChatBody(),
      ),
    );
  }
}
