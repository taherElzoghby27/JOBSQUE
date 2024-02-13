import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/fake_data.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/empty_widget.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';
import 'package:jobsque/features/messages/presentation/view/widgets/messages_list_view.dart';

class SectionMessages extends StatelessWidget {
  const SectionMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          //unread     read all messages
          AspectRatio(
            aspectRatio: AppConsts.aspect20on2,
            child: TileWidget(
              label: StringsEn.unRead,
              trailingLabel: StringsEn.readAllMessages,
              trailingOnTap: () {},
            ),
          ),
          //chats
          chats_list.isEmpty
              ? const EmptyWidget(
                  icon: AppAssets.noMessages,
                  title: StringsEn.youHaveNotReceivedMessages,
                  subTitle: StringsEn.onceYourAppHasReached,
                )
              : Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const MessagesListView(),
                  ),
                ),
        ],
      ),
    );
  }
}
