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
    return InkWell(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: AppConsts.aspect16on3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///logo
            Expanded(
              child: CustomPhoto(image: logo),
            ),

            Expanded(
              flex: 5,
              child: Padding(
                padding: AppConsts.padding10Horiz,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
            ),

            ///trailing
            trailing,
          ],
        ),
      ),
    );
  }
}
