import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/customButton.dart';

import '../../../../../core/consts/routesPage.dart';
import '../../../../../core/consts/style.dart';

class LowerItemSuggestedJob extends StatelessWidget {
  const LowerItemSuggestedJob({super.key, required this.job});
final Job job;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Text(
                '\$${job.salary}',
                style: AppConsts.style20,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '/${StringsEn.month}',
                style: AppConsts.style14,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonApply,
            child: CustomButton(
              text: StringsEn.applyNow,
              onTap: () => GoRouter.of(context).push(
                applyJopPath,
                extra: {
                  StringsEn.status: StringsEn.notOpen,
                  StringsEn.jobId: job.id.toString(),
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
