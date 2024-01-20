import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/features/complete_profile/presentation/view/widgets/section_complete_profile.dart';
import 'package:jobsque/features/complete_profile/presentation/view/widgets/section_percent_indicator.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class CompleteProfileBody extends StatelessWidget {
  const CompleteProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          SizedBox(height: size.height * .02.h),

          //custom appBar
          CustomAppBar(
            leadingOnTap: () => GoRouter.of(context).pop(),
            title: StringsEn.completeProfile,
            trailingWidget: Container(),
          ),
          SizedBox(height: size.height * .02.h),
          //percent indicator
          SectionPercentIndicator(),
          //complete your profile
          SectionCompleteProfile(),
        ],
      ),
    );
  }
}
