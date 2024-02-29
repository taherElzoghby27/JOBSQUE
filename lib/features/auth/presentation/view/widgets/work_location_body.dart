import 'package:flutter/cupertino.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/auth/presentation/view/widgets/work_interested_in_top_section.dart';

import '../../../../../core/consts/strings.dart';
import 'all_countries.dart';
import 'button_work_location_bloc_consumer.dart';
import 'home_or_office_widget.dart';

class WorkLocationBody extends StatelessWidget {
  const WorkLocationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),

          ///title in location work in page
          TopSectionTitle(
            title: StringsEn.whereAreYouLocation,
            subTitle: StringsEn.letUsKnowWhereIsTheWork,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),

          ///home or office
          const HomeOrOfficeWidget(),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              StringsEn.selectCountrForJop,
              style: AppConsts.style16,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect40on1),

          ///countries
          const AllCountryWidget(),
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),

          ///next
          AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth,
            child: ButtonWorkLocationBlocConsumer(),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        ],
      ),
    );
  }
}
