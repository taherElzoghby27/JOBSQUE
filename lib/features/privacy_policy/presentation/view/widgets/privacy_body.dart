import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../terms_and_conditions/presentation/view/widgets/content_terms_and_condition.dart';

class PrivacyBody extends StatelessWidget {
  const PrivacyBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const AspectRatio(aspectRatio:AppConsts.aspect16on1),
          CustomAppBar(
            leadingOnTap: () => GoRouter.of(context).pop(),
            title: StringsEn.privacyPolicy,
            trailingWidget: Container(),
          ),
          const AspectRatio(aspectRatio:AppConsts.aspect16on1),
          //content
          ContentTermsCond(
            heading: StringsEn.yourPrivacy,
            subHeading: StringsEn.loremIpsum,
          ),
          ContentTermsCond(
            heading: StringsEn.dataControllers,
            subHeading: StringsEn.loremIpsum,
          ),
        ],
      ),
    );
  }
}
