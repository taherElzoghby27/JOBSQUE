import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/widgets/custom_circle_button.dart';
import 'package:jobsque/core/widgets/text_field.dart';

import '../../../../../core/consts/strings.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(15.sp),
      child: Column(
        children: [
          ///hi <name>
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * .75.w,
                    child: Text(
                      '${StringsEn.hi}${CacheHelper.getData(key: StringsEn.name)}',
                      style: AppConsts.style24,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    StringsEn.createBetterFuture,
                    style: AppConsts.style14.copyWith(
                      color: AppConsts.neutral500,
                    ),
                  ),
                ],
              ),
              CustomCircleButton(
                icon: AppAssets.notification,
                onTap: () => GoRouter.of(context).push(notificationPath),
              ),
            ],
          ),

          SizedBox(height: size.height * .04.h),

          ///search field
          CustomTextField(
            perfixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
            hint: StringsEn.search,
            readOnly: true,
            onTap: () => GoRouter.of(context).push(searchPath),
            border: AppConsts.normalBorderField.copyWith(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
        ],
      ),
    );
  }
}
