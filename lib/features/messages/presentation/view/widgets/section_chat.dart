import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/fake_data.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/messages/presentation/view/widgets/chat_bubble.dart';
import 'package:jobsque/features/messages/presentation/view/widgets/chat_bubble_for_friends.dart';

class SectionChat extends StatelessWidget {
  const SectionChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          //list of messages
          Expanded(
            child: Container(
              color: AppConsts.neutral200.withOpacity(.5),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView.builder(
                reverse: true,
                physics: const BouncingScrollPhysics(),
                itemCount: messages_lists.length,
                itemBuilder: (BuildContext context, int index) {
                  return 1 == messages_lists[index].id
                      ? ChatBubble(message: messages_lists[index])
                      : ChatBubbForFriend(message: messages_lists[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
