import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/features/home/presentation/view/widgets/section_suggested_jops.dart';

import '../../../../../core/consts/routesPage.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class SuggestedJopBody extends StatelessWidget {
  const SuggestedJopBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * .02.h),

        //custom appBar
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pushReplacement(homePath),
          title: StringsEn.suggestedJob,
          trailingWidget: Container(),
        ),
        SizedBox(height: size.height * .02.h),
        //suggested jops
        SectionSuggestedJops(),
      ],
    );
  }
}
