import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

import '../../../../../core/consts/strings.dart';
import 'component_job_type_bloc_builder.dart';

class CustomComponentJopType extends StatelessWidget {
  const CustomComponentJopType({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsEn.jobType,
          style: AppConsts.style16White.copyWith(
            color: AppConsts.neutral900,
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect40on1),
        const ComponentJobTypeBlocBuilder(),
      ],
    );
  }
}
