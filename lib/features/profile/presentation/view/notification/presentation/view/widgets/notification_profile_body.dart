import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/profile/presentation/view/notification/presentation/view/widgets/section_job_notification.dart';
import 'package:jobsque/features/profile/presentation/view/notification/presentation/view/widgets/section_other_notification.dart';
import 'package:jobsque/core/consts/style.dart';

class NotificationProfileBody extends StatelessWidget {
  const NotificationProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pushReplacement(
            homePath,
            extra: 4,
          ),
          title: StringsEn.notification,
          trailingWidget: Container(),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        //Job notification
        const SectionJopNotification(),
        //Other notification
        const SectionOtherNotification(),
      ],
    );
  }
}
