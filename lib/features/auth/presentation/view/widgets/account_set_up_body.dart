
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/customButton.dart';

class AccountSetUpBody extends StatelessWidget {
  const AccountSetUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            ///back
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            SizedBox(height: size.height * .15.h),

            ///icon
            SvgPicture.asset(AppAssets.user, height: size.height * .1),
            const AspectRatio(aspectRatio:AppConsts.aspect16on1),

            ///title
            Text(
              StringsEn.yourAccountHasBeenSetUp,
              style: AppConsts.style24,
            ),

            ///subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                StringsEn.weHaveCustomizedFeeds,
                style: AppConsts.style14,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: size.height * .4.h),

            ///get started
            SizedBox(
              height: size.height * .055.h,
              width: size.width * .9.w,
              child: CustomButton(
                text: StringsEn.getStarted,
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
