
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/handle_date.dart';
import 'package:jobsque/core/widgets/custom_divider.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/core/widgets/logo_title_icon_widget.dart';
import 'package:jobsque/features/notification/data/models/notification.dart';

class NotificationListView extends StatelessWidget {
  const NotificationListView({
    super.key,
    required this.notificationModel,
  });

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return FadeAnimation(
          millSeconds: 250,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          handleDate(
                            date: notificationModel.updatedAt!,
                          )[0],
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          handleDate(
                            date: notificationModel.updatedAt!,
                          )[1],
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
    );
  }
}
