import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/bookmark_widget.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/type_jop_component.dart';

import '../../../../../core/widgets/custom_photo.dart';
import 'lower_item_suggested_job.dart';
import 'middle_item_suggested_job.dart';
import 'upper_item_suggested_job.dart';

class ItemSuggestedJop extends StatelessWidget {
  const ItemSuggestedJop({
    super.key,
    required this.job,
    required this.onTap,
  });

  final Job job;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: AppConsts.allPadding8,
        child: Container(
          width: size.width * .8.w,
          decoration: BoxDecoration(
            color: AppConsts.primary900,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: AppConsts.allPadding15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //logo jopName
                UpperItemSuggestedJob(job: job),
                //full time -remote -design
                MiddleItemSuggestedJob(job: job),
                //salary - apply jop
                LowerItemSuggestedJob(job: job),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
