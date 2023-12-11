import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/saved/presentation/view/widgets/section_saved_jop.dart';

class SavedBody extends StatelessWidget {
  const SavedBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * .02.h),

        //custom appBar
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pushReplacement(homePath),
          title: StringsEn.saved,
          trailingWidget: Container(),
        ),
        SizedBox(height: size.height * .02.h),
        //saved jops
        SectionSavedJop(),
        // EmptyWidget(
        //   icon: AppAssets.savedIlus,
        //   title: StringsEn.noThingHasBeenSaved,
        //   subTitle: StringsEn.pressTheStarIcon,
        // ),
      ],
    );
  }
}
