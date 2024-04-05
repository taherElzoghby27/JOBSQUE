import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/messages/presentation/view/widgets/section_chat.dart';
import 'package:jobsque/features/messages/presentation/view/widgets/section_send_message.dart';

import 'setting_sheet_chat_body.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    ///show setting chat
    _showSettingChatSheet(BuildContext context) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SettingChatSheetBody();
        },
      );
    }

    return Column(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        //back   title   settings
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pushReplacement(
            homePath,
            extra: 1,
          ),
          image: AppAssets.twitter,
          title: StringsEn.twitter,
          trailingWidget: IconButton(
            onPressed: () => _showSettingChatSheet(context),
            icon: Icon(
              Icons.more_horiz,
              color: AppConsts.neutral900,
            ),
          ),
        ),
        //chat
        const SectionChat(),
        //field ->write a messsage
        Padding(
          padding: AppConsts.mainPadding,
          child: const SectionSendMessage(),
        ),
      ],
    );
  }
}
