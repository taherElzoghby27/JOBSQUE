import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/profile/presentation/view/language/presentation/view/widgets/section_languages.dart';
import 'package:jobsque/core/consts/style.dart';
class LanguagesBody extends StatelessWidget {
  const LanguagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const AspectRatio(aspectRatio:AppConsts.aspect16on1),
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pop(),
          title: StringsEn.language,
          trailingWidget: Container(),
        ),
        SizedBox(height: size.height * .01.h),
        //languages
        SectionLangugaes(),
      ],
    );
  }
}
