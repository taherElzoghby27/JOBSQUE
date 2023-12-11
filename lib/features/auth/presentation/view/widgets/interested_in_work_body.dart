import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/features/auth/presentation/view/widgets/section_type_job.dart';

import 'work_interested_in_top_section.dart';

class InterestedInWorkBody extends StatelessWidget {
  const InterestedInWorkBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(25.sp),
      child: Column(
        children: [
          ///title in work interested in page
          TopSectionTitle(
            title: StringsEn.whatTypeOfWorkInterested,
            subTitle: StringsEn.tellUsWhatYouAreInterestedIn,
          ),
          SizedBox(height: size.height * .04.h),

          ///type
          SectionTypeJob(),
          SizedBox(height: size.height * .065.h),

          SizedBox(
            height: size.height * .055.h,
            width: size.width * .9.w,
            child: CustomButton(
              text: StringsEn.next,
              onTap: () =>
                  GoRouter.of(context).pushReplacement(locationWorkPath),
            ),
          ),
        ],
      ),
    );
  }
}
