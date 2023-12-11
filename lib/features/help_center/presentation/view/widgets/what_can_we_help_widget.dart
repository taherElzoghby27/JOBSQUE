import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/text_field.dart';

class WhatCanWeHelpWidget extends StatelessWidget {
  const WhatCanWeHelpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: CustomTextField(
        perfixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
        hint: StringsEn.whatCanWeHelp,
        controller: TextEditingController(),
        border: AppConsts.normalBorderField.copyWith(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    );
  }
}
