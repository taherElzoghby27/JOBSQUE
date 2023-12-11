
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/logo_title_icon_widget.dart';

class ItemSavedJop extends StatelessWidget {
  const ItemSavedJop({
    super.key,
    required this.logo,
    required this.jopTitle,
    required this.company,
    required this.country,
    required this.onTapTrailing,
    required this.when,
  });

  final String logo;
  final String jopTitle;
  final String company;
  final String country;
  final String when;
  final void Function() onTapTrailing;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          LogoTitleIconWidget(
            logo: logo,
            jopTitle: jopTitle,
            company: company,
            country: country,
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
                when,
                style: AppConsts.style12.copyWith(color: AppConsts.neutral700),
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
    );
  }
}
