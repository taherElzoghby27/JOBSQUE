import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/fake_data.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/text_field.dart';
import 'package:jobsque/features/messages/presentation/view/widgets/chat_bubble.dart';
import 'package:jobsque/features/messages/presentation/view/widgets/chat_bubble_for_friends.dart';

import '../../../../../core/widgets/custom_circle_button.dart';

class SectionChat extends StatelessWidget {
  const SectionChat({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Column(
        children: [
          //list of messages
          Expanded(
            child: Container(
              color: AppConsts.neutral200.withOpacity(.5),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView.builder(
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
          //field ->write a messsage
          SizedBox(
            height: size.height * .09.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  SizedBox(width: size.width * .01.w),
                  //asset
                  CustomCircleButton(
                    icon: AppAssets.assets,
                    onTap: () {},
                  ),
                  SizedBox(width: size.width * .05.w),
                  //write a message
                  Expanded(
                    child: CustomTextField(
                      hint: StringsEn.writeAMessage,
                      controller: TextEditingController(),
                    ),
                  ),
                  SizedBox(width: size.width * .05.w),
                  //microphone
                  CustomCircleButton(
                    icon: AppAssets.micro,
                    onTap: () {},
                  ),
                  SizedBox(width: size.width * .01.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
