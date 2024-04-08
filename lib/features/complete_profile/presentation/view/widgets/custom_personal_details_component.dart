import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/widgets/section_edit_photo.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/widgets/section_personal_info.dart';

import 'section_button_edit_personal_details.dart';

class CustomPersonalDetailsComponent extends StatelessWidget {
  const CustomPersonalDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //edit photo
        const SectionEditPhoto(),
        //edit personal info
        const SectionPersonalInfo(),
        const AspectRatio(aspectRatio: AppConsts.aspect16on7),
        //save
        const SectionButtonEditPersonalDetails(),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
      ],
    );
  }
}
