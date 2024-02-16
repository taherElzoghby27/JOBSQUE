import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';

import 'custom_photo.dart';

class LogoTitleIconWidget extends StatelessWidget {
  const LogoTitleIconWidget({
    super.key,
    required this.logo,
    required this.jopTitle,
    required this.company,
    required this.country,
    required this.trailing,
    this.onTap,
  });

  final String logo;
  final String jopTitle;
  final String company;
  final String country;

  final Widget trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///logo
          Expanded(
            child: CustomPhoto(image: logo),
          ),
          SizedBox(width: size.width * .03.w),

          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///title
                Text(
                  jopTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppConsts.style32.copyWith(
                    fontSize: 18,
                  ),
                ),

                ///company.country
                Text(
                  '$company.$country',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppConsts.styleHint14.copyWith(
                    fontSize: 12,
                    color: AppConsts.neutral700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: size.width * .02.w),

          ///trailing
          trailing,
        ],
      ),
    );
  }
}
