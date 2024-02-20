import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/consts/routesPage.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'jobs.dart';

class AppliedBody extends StatelessWidget {
  const AppliedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pushReplacement(homePath),
          title: StringsEn.appliedJob,
          trailingWidget: Container(),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        //jobs
        AspectRatio(
          aspectRatio: AppConsts.aspect20on36,
          child: const Jobs(),
        ),
      ],
    );
  }
}
