import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/core/widgets/logo_title_icon_widget.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';

import '../../../../../core/consts/style.dart';

class SectionNotification extends StatelessWidget {
  const SectionNotification({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: size.height * .04.h,
            child: TileWidget(label: StringsEn.notifications),
          ),

          ///notification
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return FadeAnimation(
                    millSeconds: 250,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LogoTitleIconWidget(
                        logo: AppAssets.twitter,
                        jopTitle: 'Dana',
                        company: 'Posted new design jobs',
                        country: '',
                        trailing: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: AppConsts.warning600,
                              size: size.height * .0125.h,
                            ),
                            SizedBox(width: size.width * .01.w),
                            Text('10:00Am'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 44,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: AppConsts.neutral200),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
