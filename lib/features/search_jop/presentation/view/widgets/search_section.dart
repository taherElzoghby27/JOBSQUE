import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/widgets/text_field.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';

class SectionSearch extends StatelessWidget {
  const SectionSearch({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///back
        IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
          ),
        ),

        ///search field
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: CustomTextField(
              perfixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
              hint: StringsEn.typeSomething,
              controller: searchController,
              border: AppConsts.normalBorderField.copyWith(
                borderRadius: BorderRadius.circular(35),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
