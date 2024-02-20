
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/home/presentation/view/widgets/section_suggested_or_recent_jobs_listview_blocBuilder.dart';
import '../../../../../core/consts/routesPage.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class SuggestedOrRecentJopBody extends StatelessWidget {
  const SuggestedOrRecentJopBody({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),

        //custom appBar
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pushReplacement(homePath),
          title: type == StringsEn.suggestedJob
              ? StringsEn.suggestedJob
              : StringsEn.recentJob,
          trailingWidget: Container(),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        //suggested jops
        const SectionSuggestedOrRecentJopsListViewBlocBuilder(),
      ],
    );
  }
}
