import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/widgets/load_json_widget.dart';
import 'package:jobsque/features/notification/presentation/view/widgets/section_notification.dart';
import 'package:jobsque/features/notification/presentation/view_model/notification_cubit.dart';
import 'package:jobsque/core/consts/style.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/empty_widget.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const AspectRatio(aspectRatio:AppConsts.aspect16on1),

        //custom appBar
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pushReplacement(homePath),
          title: StringsEn.notification,
          trailingWidget: Container(),
        ),
        const AspectRatio(aspectRatio:AppConsts.aspect16on1),
        //notifications
        BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state is NotificationSuccess) {
              return SectionNotification(
                notificationModel: state.notificationModel,
              );
            } else if (state is NotificationLoading) {
              return LoadJsonWidget();
            } else if (state is NotificationFailure) {
              //empty widget
              return EmptyWidget(
                icon: AppAssets.notifIllus,
                title: StringsEn.noNewNotificationsYet,
                subTitle: StringsEn.youWillReceiveNotification,
              );
            }
            //empty widget
            return LoadJsonWidget();
          },
        ),
      ],
    );
  }
}
