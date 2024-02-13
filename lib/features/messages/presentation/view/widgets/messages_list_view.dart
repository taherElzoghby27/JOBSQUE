import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/fake_data.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_divider.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/core/widgets/logo_title_icon_widget.dart';

import 'package:jobsque/core/consts/routesPage.dart';

import 'package:go_router/go_router.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return FadeAnimation(
          millSeconds: 250,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: LogoTitleIconWidget(
              logo: chats_list[index].logo,
              jopTitle: chats_list[index].name,
              company: chats_list[index].lastMessage,
              country: '',
              trailing: Text(
                chats_list[index].time,
                style: AppConsts.style12.copyWith(
                  color: AppConsts.primary500,
                ),
              ),
              onTap: () => GoRouter.of(context).push(chatPath),
            ),
          ),
        );
      },
      itemCount: chats_list.length,
      separatorBuilder: (BuildContext context, int index) =>
          const CustomDivider(),
    );
  }
}
