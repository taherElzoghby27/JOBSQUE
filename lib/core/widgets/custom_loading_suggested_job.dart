import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/loading_widget_jobs_suggested_recent_body.dart';

class CustomLoadingSuggestedJob extends StatelessWidget {
  const CustomLoadingSuggestedJob({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: AppConsts.mainPadding,
      child: Container(
        width: size.width * .8.w,
        child: const LoadingWidgetJobsSuggestedRecentBody(),
      ),
    );
  }
}
