import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/features/complete_profile/presentation/view/widgets/section_complete_profile.dart';
import 'package:jobsque/features/complete_profile/presentation/view/widgets/section_percent_indicator.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../data/models/complete_profile_model.dart';

class CompleteProfileBody extends StatefulWidget {
  const CompleteProfileBody({super.key});

  @override
  State<CompleteProfileBody> createState() => _CompleteProfileBodyState();
}

class _CompleteProfileBodyState extends State<CompleteProfileBody> {
  CompleteProfileModel completeProfileModel = CompleteProfileModel();
  int nOfTrue = 0;

  @override
  void initState() {
    getData();
    nOfTrue = calculateHowManyTrue();
    super.initState();
  }

  getData() async {
    completeProfileModel.personalDetailsStatus =
        CacheHelper.getData(key: StringsEn.personalDetailsCompleteK) ?? false;
    completeProfileModel.educationStatus =
        CacheHelper.getData(key: StringsEn.educationCompleteK) ?? false;
    completeProfileModel.experienceStatus =
        CacheHelper.getData(key: StringsEn.experienceCompleteK) ?? false;
    completeProfileModel.portfolioStatus =
        CacheHelper.getData(key: StringsEn.portfolioCompleteK) ?? false;
  }

  int calculateHowManyTrue() {
    int trueCount = 0;
    if (completeProfileModel.personalDetailsStatus == true) {
      trueCount++;
    }
    if (completeProfileModel.educationStatus == true) {
      trueCount++;
    }
    if (completeProfileModel.experienceStatus == true) {
      trueCount++;
    }
    if (completeProfileModel.portfolioStatus == true) {
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
          SectionCompleteProfile(completeProfileModel: completeProfileModel),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        ],
      ),
    );
  }
}
