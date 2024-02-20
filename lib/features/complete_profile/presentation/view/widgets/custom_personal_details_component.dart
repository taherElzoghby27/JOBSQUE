import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/widgets/section_edit_photo.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/widgets/section_personal_info.dart';

import '../../../../../core/widgets/customButton.dart';
import '../../../../../core/widgets/small_loading_widget.dart';

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
        const AspectRatio(aspectRatio: AppConsts.aspect16on2),
        //save
        Center(
          child: AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth,
            child: Visibility(
              visible: true,
              replacement:const LoadingWidget(),
              child: CustomButton(
                text: StringsEn.save,
                onTap: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
