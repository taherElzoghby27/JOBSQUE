import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/profile/presentation/view/notification/presentation/view/widgets/section_job_notification.dart';
import 'package:jobsque/features/profile/presentation/view/notification/presentation/view/widgets/section_other_notification.dart';

class NotificationProfileBody extends StatelessWidget {
  const NotificationProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * .02.h),
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pop(),
          title: StringsEn.notification,
          trailingWidget: Container(),
        ),
        SizedBox(height: size.height * .01.h),
        //Job notification
        SectionJopNotification(),
        //Other notification
        SectionOtherNotification(),
      ],
    );
  }
}
