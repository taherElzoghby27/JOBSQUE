import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_divider.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';

import 'custom_tile_switch.dart';

class SectionJopNotification extends StatefulWidget {
  const SectionJopNotification({super.key});

  @override
  State<SectionJopNotification> createState() => _SectionJopNotificationState();
}

class _SectionJopNotificationState extends State<SectionJopNotification> {
  bool yourJopSearchAlert = false;
  bool jobApplicationUpdate = false;
  bool jobApplicationReminders = false;
  bool jobsYouMayBeInterestedIn = false;
  bool jobSeekerUpdates = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //job notif
        TileWidget(
          label: StringsEn.jopNotification,
        ),
        //yourJopSearchAlert
        CustomTileSwitch(
          label: StringsEn.yourJopSearchAlert,
          value: yourJopSearchAlert,
          styleText: AppConsts.style16.copyWith(color: AppConsts.neutral900),
          onChanged: (bool v) {
            setState(() => yourJopSearchAlert = v);
          },
        ),
        CustomDivider(),
        //jobApplicationUpdate
        CustomTileSwitch(
          label: StringsEn.jobApplicationUpdate,
          value: jobApplicationUpdate,
          styleText: AppConsts.style16.copyWith(color: AppConsts.neutral900),
          onChanged: (bool v) {
            setState(() => jobApplicationUpdate = v);
          },
        ),
        CustomDivider(),
        //jobApplicationReminders
        CustomTileSwitch(
          label: StringsEn.jobApplicationReminders,
          styleText: AppConsts.style16.copyWith(color: AppConsts.neutral900),
          value: jobApplicationReminders,
          onChanged: (bool v) {
            setState(() => jobApplicationReminders = v);
          },
        ),
        CustomDivider(),
        //jobsYouMayBeInterestedIn
        CustomTileSwitch(
          label: StringsEn.jobsYouMayBeInterestedIn,
          value: jobsYouMayBeInterestedIn,
          styleText: AppConsts.style16.copyWith(color: AppConsts.neutral900),
          onChanged: (bool v) {
            setState(() => jobsYouMayBeInterestedIn = v);
          },
        ),
        CustomDivider(),
        //jobSeekerUpdates
        CustomTileSwitch(
          label: StringsEn.jobSeekerUpdates,
          value: jobSeekerUpdates,
          styleText: AppConsts.style16.copyWith(color: AppConsts.neutral900),
          onChanged: (bool v) {
            setState(() => jobSeekerUpdates = v);
          },
        ),
        CustomDivider(),
      ],
    );
  }
}
