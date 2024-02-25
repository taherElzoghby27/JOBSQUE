import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/features/complete_profile/presentation/view/widgets/section_complete_profile.dart';
import 'package:jobsque/features/complete_profile/presentation/view/widgets/section_percent_indicator.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class CompleteProfileBody extends StatefulWidget {
  const CompleteProfileBody({super.key});

  @override
  State<CompleteProfileBody> createState() => _CompleteProfileBodyState();
}

class _CompleteProfileBodyState extends State<CompleteProfileBody> {
  late bool personalDetailsStatus;
  late bool educationStatus;
  late bool experienceStatus;
  late bool portfolioStatus;
  int nOfTrue = 0;

  @override
  void initState() {
    getData();
    nOfTrue = calculateHowManyTrue();
    super.initState();
  }

  getData() {
    personalDetailsStatus =
        CacheHelper.getData(key: StringsEn.personalDetailsCompleteK) ?? false;
    educationStatus =
        CacheHelper.getData(key: StringsEn.educationCompleteK) ?? false;
    experienceStatus =
        CacheHelper.getData(key: StringsEn.experienceCompleteK) ?? false;
    portfolioStatus =
        CacheHelper.getData(key: StringsEn.portfolioCompleteK) ?? false;
  }

  int calculateHowManyTrue() {
    int trueCount = 0;
    if (personalDetailsStatus == true) {
      trueCount++;
    }
    if (educationStatus == true) {
      trueCount++;
    }
    if (experienceStatus == true) {
      trueCount++;
    }
    if (portfolioStatus == true) {
      trueCount++;
    }
    return trueCount;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          //custom appBar
          CustomAppBar(
            leadingOnTap: () => GoRouter.of(context).pushReplacement(
              homePath,
              extra: 4,
            ),
            title: StringsEn.completeProfile,
            trailingWidget: Container(),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //percent indicator
          SectionPercentIndicator(nOfManyTrue: nOfTrue),
          //complete your profile
          SectionCompleteProfile(
            personalDetails: personalDetailsStatus,
            education: educationStatus,
            experience: experienceStatus,
            portfolio: portfolioStatus,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        ],
      ),
    );
  }
}
