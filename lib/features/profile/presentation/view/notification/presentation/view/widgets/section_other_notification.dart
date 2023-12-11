import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

import '../../../../../../../../core/consts/strings.dart';
import '../../../../../../../../core/widgets/custom_divider.dart';
import '../../../../../../../../core/widgets/tile_widget.dart';
import 'custom_tile_switch.dart';

class SectionOtherNotification extends StatefulWidget {
  const SectionOtherNotification({super.key});

  @override
  State<SectionOtherNotification> createState() =>
      _SectionOtherNotificationState();
}

class _SectionOtherNotificationState extends State<SectionOtherNotification> {
  bool showProfile = false;
  bool allMessage = false;
  bool messageNudges = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //job notif
        TileWidget(label: StringsEn.otherNotification),
        //showProfile
        CustomTileSwitch(
          label: StringsEn.showProfile,
          styleText: AppConsts.style16.copyWith(color: AppConsts.neutral900),
          value: showProfile,
          onChanged: (bool v) {
            setState(() => showProfile = v);
          },
        ),
        CustomDivider(),
        //allMessage
        CustomTileSwitch(
          label: StringsEn.allMessage,
          styleText: AppConsts.style16.copyWith(color: AppConsts.neutral900),
          value: allMessage,
          onChanged: (bool v) {
            setState(() => allMessage = v);
          },
        ),
        CustomDivider(),
        //messageNudges
        CustomTileSwitch(
          label: StringsEn.messageNudges,
          styleText: AppConsts.style16.copyWith(color: AppConsts.neutral900),
          value: messageNudges,
          onChanged: (bool v) {
            setState(() => messageNudges = v);
          },
        ),
        CustomDivider(),
      ],
    );
  }
}
