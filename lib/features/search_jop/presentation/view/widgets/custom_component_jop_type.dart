import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/custom_type_jop_widget.dart';

import '../../../../../core/consts/strings.dart';

class CustomComponentJopType extends StatelessWidget {
  const CustomComponentJopType({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsEn.jobType,
          style: AppConsts.style16White.copyWith(
            color: AppConsts.neutral900,
          ),
        ),
        SizedBox(height: size.height * .01.h),
        Wrap(
          runSpacing: 10,
          spacing: 25,
          children: [
            CustomTypeJopWidget(
              label: StringsEn.fullTime,
              labelColor: AppConsts.primary500,
              onTap: () {},
            ),
            CustomTypeJopWidget(
              label: StringsEn.remote,
              labelColor: AppConsts.neutral500,
              onTap: () {},
            ),
            CustomTypeJopWidget(
              label: StringsEn.contract,
              labelColor: AppConsts.neutral500,
              onTap: () {},
            ),
            CustomTypeJopWidget(
              label: StringsEn.partTime,
              labelColor: AppConsts.primary500,
              onTap: () {},
            ),
            CustomTypeJopWidget(
              label: StringsEn.onSite,
              labelColor: AppConsts.neutral500,
              onTap: () {},
            ),
            CustomTypeJopWidget(
              label: StringsEn.internship,
              labelColor: AppConsts.neutral500,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
