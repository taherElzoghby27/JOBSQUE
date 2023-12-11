import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/auth/presentation/view/widgets/work_interested_in_top_section.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/customButton.dart';
import 'all_countries.dart';
import 'home_or_office_widget.dart';

class WorkLocationBody extends StatelessWidget {
  const WorkLocationBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(25.sp),
      child: Column(
        children: [
          ///title in location work in page
          TopSectionTitle(
            title: StringsEn.whereAreYouLocation,
            subTitle: StringsEn.letUsKnowWhereIsTheWork,
          ),
          SizedBox(height: size.height * .04.h),

          ///home or office
          HomeOrOfficeWidget(),
          SizedBox(height: size.height * .03.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              StringsEn.selectCountrForJop,
              style: AppConsts.style16,
            ),
          ),
          SizedBox(height: size.height * .03.h),

          ///countries
          AllCountryWidget(),
          SizedBox(height: size.height * .1.h),

          ///next
          SizedBox(
            height: size.height * .055.h,
            width: size.width * .9.w,
            child: CustomButton(
              text: StringsEn.next,
              onTap: () => GoRouter.of(context).pushReplacement(
                successfullyPagePath,
                extra: {
                  StringsEn.icon: AppAssets.user,
                  StringsEn.title: StringsEn.yourAccountHasBeenSetUp,
                  StringsEn.subTitle: StringsEn.weHaveCustomizedFeeds,
                  StringsEn.labelButton: StringsEn.getStarted,
                  StringsEn.path: homePath,
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
