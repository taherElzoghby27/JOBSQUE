// ignore_for_file: dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/chip_response_applied.dart';

import '../../../../../core/consts/assets.dart';

class SectionAppliedJop extends StatelessWidget {
  const SectionAppliedJop({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: size.height * .125.h,
        decoration: AppConsts.decorationRadius8.copyWith(
          color: AppConsts.primary100,
          border: Border.all(color: AppConsts.primary100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(flex: 2),
            //logo
            Column(
              children: [
                const AspectRatio(aspectRatio:AppConsts.aspect16on1),
                SvgPicture.asset(AppAssets.twitter),
              ],
            ),
            Spacer(flex: 2),
            //company name
            SizedBox(
              width: size.width * .5.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Spacer(flex: 3),
                  Text(
                    'Twitter',
                    style: AppConsts.style16White.copyWith(
                      color: AppConsts.neutral900,
                    ),
                  ),
                  Spacer(flex: 1),
                  Text(
                    'Waiting to be selected by the twitter team',
                    style:
                        AppConsts.style12.copyWith(color: AppConsts.neutral700),
                    maxLines: 2,
                  ),
                  Spacer(flex: 3),
                ],
              ),
            ),
            Spacer(flex: 3),
            //submitted or accepted chip
            ChipResponseApplied(
              label: true ? StringsEn.accepted : StringsEn.submited,
              color: true ? AppConsts.success800 : AppConsts.primary700,
              background: true ? AppConsts.success300 : AppConsts.primary200,
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
