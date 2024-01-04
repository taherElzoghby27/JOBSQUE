import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/logo_title_icon_widget.dart';

class ItemSavedJop extends StatelessWidget {
  const ItemSavedJop({
    super.key,
    required this.onTapTrailing,
    required this.job,
  });

  final Job job;
  final void Function() onTapTrailing;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => GoRouter.of(context).push(
        jopDetailPath,
        extra: job,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            LogoTitleIconWidget(
              logo: job.image!,
              jopTitle: job.name!,
              company: job.compName!,
              country: job.location!,
              trailing: IconButton(
                onPressed: onTapTrailing,
                icon: Icon(Icons.more_horiz),
              ),
            ),
            SizedBox(height: size.height * .02.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Posted 2 days ago
                Text(
                  DateFormat().add_MMMEd().format(
                        convertStringToTime(time: job.updatedAt!),
                      ),
                  style:
                      AppConsts.style12.copyWith(color: AppConsts.neutral700),
                ),

                //Posted 2 days ago
                Row(
                  children: [
                    //time
                    Icon(
                      Icons.access_time_rounded,
                      size: size.height * .0225.h,
                      color: AppConsts.success700,
                    ),
                    SizedBox(width: size.width * .01.w),
                    //be an early applicant
                    Text(
                      StringsEn.beAnEarly,
                      style: AppConsts.style12.copyWith(
                        color: AppConsts.neutral700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  DateTime convertStringToTime({required String time}) {
    DateTime dateTime = DateTime.parse(time);
    return dateTime;
  }
}
