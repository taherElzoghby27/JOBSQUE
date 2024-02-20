import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';
import 'package:jobsque/features/notification/data/models/notification.dart';
import 'package:jobsque/features/notification/presentation/view/widgets/notifications_listview.dart';

class SectionNotifications extends StatelessWidget {
  const SectionNotifications({
    super.key,
    required this.notificationModel,
  });

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const AspectRatio(
            aspectRatio: AppConsts.aspect20on2,
            child: TileWidget(label: StringsEn.notifications),
          ),

          ///notification
          Expanded(
            child: Padding(
              padding: AppConsts.padding10Horiz,
              child: NotificationListView(notificationModel: notificationModel),
            ),
          ),
        ],
      ),
    );
  }
}
