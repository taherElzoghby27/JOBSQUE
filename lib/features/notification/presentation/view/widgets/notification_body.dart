import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/features/notification/presentation/view/widgets/section_notification.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * .02.h),

        //custom appBar
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pushReplacement(homePath),
          title: StringsEn.notification,
          trailingWidget: Container(),
        ),
        SizedBox(height: size.height * .02.h),
        //notifications
        SectionNotification(),
        // EmptyWidget(
        //   icon: AppAssets.notifIllus,
        //   title: StringsEn.noNewNotificationsYet,
        //   subTitle: StringsEn.youWillReceiveNotification,
        // ),
      ],
    );
  }
}
