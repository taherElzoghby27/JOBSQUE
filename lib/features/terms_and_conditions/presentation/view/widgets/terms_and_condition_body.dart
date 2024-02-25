import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';

import 'content_terms_and_condition.dart';
import 'package:jobsque/core/consts/style.dart';

class TermsAndConditionBody extends StatelessWidget {
  const TermsAndConditionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          CustomAppBar(
            leadingOnTap: () => GoRouter.of(context).pushReplacement(
              homePath,
              extra: 4,
            ),
            title: StringsEn.termsCondition,
            trailingWidget: Container(),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
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
