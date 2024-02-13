import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/widgets/error_widget.dart';
import 'package:jobsque/core/widgets/fading_list_view.dart';
import 'package:jobsque/features/home/presentation/view/widgets/loading_listview_fading.dart';
import 'package:jobsque/features/notification/presentation/view/widgets/custom_fading_item_notification.dart';
import 'package:jobsque/features/notification/presentation/view_model/notification_cubit.dart';

import 'section_notification.dart';

class NotificationsBlocBuilder extends StatelessWidget {
  const NotificationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationSuccess) {
          return SectionNotifications(
            notificationModel: state.notificationModel,
          );
        } else if (state is NotificationFailure) {
          return ErrorWidg(message: state.message);
        } else {
          return CustomFadingLoadingAnimation(
            widget: FadingListView(
              scrollDirc: Axis.vertical,
              widget: CustomFadingItemNotification(),
            ),
          );
        }
      },
    );
  }
}
