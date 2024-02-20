import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/helper/handle_date.dart';
import 'package:jobsque/core/widgets/custom_divider.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/core/widgets/logo_title_icon_widget.dart';
import 'package:jobsque/core/widgets/smart_fresher.dart';
import 'package:jobsque/features/notification/data/models/notification.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../view_model/notification_cubit.dart';

class NotificationListView extends StatefulWidget {
  const NotificationListView({super.key, required this.notificationModel});

  final NotificationModel notificationModel;

  @override
  State<NotificationListView> createState() => _NotificationListViewState();
}

class _NotificationListViewState extends State<NotificationListView> {
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
    NotificationModel notificationModel = widget.notificationModel;
    Size size = MediaQuery.of(context).size;
    return SmartRefreshWidget(
      refreshController: _refreshController,
      labelLoaded: StringsEn.notificationsLoaded,
      onRefresh: _onRefresh,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          List<String> date = handleDate(date: notificationModel.updatedAt!);
          return FadeAnimation(
            millSeconds: 250,
            child: Padding(
              padding: AppConsts.allPadding8,
              child: LogoTitleIconWidget(
                logo: AppAssets.amit,
                jopTitle: notificationModel.userName!,
                company: '',
                country: notificationModel.lastMassage!,
                trailing: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: AppConsts.warning600,
                      size: size.height * .0115.h,
                    ),
                    SizedBox(width: size.width * .005.w),
                    //date
                    DefaultTextStyle(
                      style: AppConsts.style12.copyWith(fontSize: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            date[0],
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            date[1],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 3,
        separatorBuilder: (BuildContext context, int index) =>
            const CustomDivider(),
      ),
    );
  }
}
