import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/features/notification/presentation/view_model/notification_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/smart_fresher.dart';
import 'notifications_bloc_builder.dart';

class NotificationSmartRefreshWidget extends StatefulWidget {
  const NotificationSmartRefreshWidget({super.key});

  @override
  State<NotificationSmartRefreshWidget> createState() =>
      _NotificationSmartRefreshWidgetState();
}

class _NotificationSmartRefreshWidgetState
    extends State<NotificationSmartRefreshWidget> {
  RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  void _onRefresh() async {
    BlocProvider.of<NotificationCubit>(context).getNotification(
      id: CacheHelper.getData(key: StringsEn.userId),
    );
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefreshWidget(
      refreshController: _refreshController,
      labelLoaded: StringsEn.notificationsLoaded,
      onRefresh: _onRefresh,
      child: const NotificationsBlocBuilder(),
    );
  }
}
