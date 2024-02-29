import 'package:flutter/cupertino.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/auth/presentation/view/widgets/section_type_job.dart';

import 'button_interestedin_work_bloc_consumer.dart';
import 'work_interested_in_top_section.dart';

class InterestedInWorkBody extends StatefulWidget {
  const InterestedInWorkBody({super.key});

  @override
  State<InterestedInWorkBody> createState() => _InterestedInWorkBodyState();
}

class _InterestedInWorkBodyState extends State<InterestedInWorkBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),

          ///title in work interested in page
          TopSectionTitle(
            title: StringsEn.whatTypeOfWorkInterested,
            subTitle: StringsEn.tellUsWhatYouAreInterestedIn,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),

          ///type
          const SectionTypeJob(),
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),

          const ButtonInterestedInWorkBlocConsumer(),
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),
        ],
      ),
    );
  }
}
