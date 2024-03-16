import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/complete_profile/presentation/view/widgets/fields_education_page.dart';

import 'section_button_education.dart';

class CustomEducationComponent extends StatelessWidget {
  const CustomEducationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppConsts.decorationRadius8,
      height: MediaQuery.sizeOf(context).height * .8,
      child: const Padding(
        padding: AppConsts.allPadding8,
        child: Column(
          children: [
            FieldsEducationPage(),
            Spacer(),
            SectionButtonEducation(),
            AspectRatio(aspectRatio: AppConsts.aspect16on1),
          ],
        ),
      ),
    );
  }
}
