import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/features/notification/presentation/view/widgets/notification_body.dart';
import 'package:jobsque/features/notification/presentation/view_model/notification_cubit.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    //get notifications
    BlocProvider.of<NotificationCubit>(context).getNotification(
      id: CacheHelper.getData(key: StringsEn.userId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationBody(),
      ),
    );
  }
}
