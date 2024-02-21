import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/loading_widget_jobs_suggested_recent_body.dart';

class CustomLoadingSuggestedJob extends StatelessWidget {
  const CustomLoadingSuggestedJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: AspectRatio(
        aspectRatio: AppConsts.aspect13on9,
        child: const LoadingWidgetJobsSuggestedRecentBody(),
      ),
    );
  }
}
