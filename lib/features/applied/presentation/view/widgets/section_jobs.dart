import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';
import 'package:jobsque/features/applied/presentation/view/widgets/custom_item_applied_job.dart';

import '../../../../../core/consts/routesPage.dart';

class SectionJobs extends StatelessWidget {
  const SectionJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TileWidget(label: '3 ${StringsEn.jobs}'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return FadeAnimation(
                millSeconds: 250,
                child: CustomItemAppliedJop(
                  logo: AppAssets.twitter,
                  jopTitle: 'Software Engineer',
                  company: 'Twitter',
                  country: 'United State',
                  onTapBookMark: () {},
                  onTap: () => GoRouter.of(context).push(completeProfilePath),
                  // onTap: () => GoRouter.of(context).push(
                  //   applyJopPath,
                  //   extra:StringsEn.notComplete ,
                  // ),
                ),
              );
            },
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) => Divider(
              color: AppConsts.neutral200,
            ),
          ),
        ),
      ],
    );
  }
}
