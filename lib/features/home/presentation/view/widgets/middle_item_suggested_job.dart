
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/type_jop_component.dart';

class MiddleItemSuggestedJob extends StatelessWidget {
  const MiddleItemSuggestedJob({
    super.key,
    required this.job,
  });

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: TypeJopComponent(
            label: job.jobTimeType!,
            color: AppConsts.neutral100,
          ),
        ),
        Expanded(
          child: TypeJopComponent(
            label: StringsEn.remote,
            color: AppConsts.neutral100,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
