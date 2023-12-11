import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';

import 'content_terms_and_condition.dart';

class TermsAndConditionBody extends StatelessWidget {
  const TermsAndConditionBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: size.height * .02.h),
          CustomAppBar(
            leadingOnTap: () => GoRouter.of(context).pop(),
            title: StringsEn.termsCondition,
            trailingWidget: Container(),
          ),
          SizedBox(height: size.height * .02.h),
          //content
          ContentTermsCond(
            heading: StringsEn.loremDolor,
            subHeading: StringsEn.loremIpsum,
          ),
          ContentTermsCond(
            heading: StringsEn.loremDolor,
            subHeading: StringsEn.subTitleLorem,
          ),
        ],
      ),
    );
  }
}
