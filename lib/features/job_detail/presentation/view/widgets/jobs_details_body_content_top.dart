import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/bookmark_widget.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';

import '../../../../../core/consts/strings.dart';
import 'info_section_jop_detail.dart';

class JobDetailsBodyContentTop extends StatelessWidget {
  const JobDetailsBodyContentTop({
    super.key,
    required this.job,
  });

  final Job job;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspect40on1),

        ///custom appBar
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pushReplacement(
            homePath,
            extra: 0,
          ),
          title: StringsEn.jobDetail,
          trailingWidget: BookmarkWidget(job: job),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect40on1),

        ///title - company -country
        InfoSectionJopDetail(job: job),
      ],
    );
  }
}
