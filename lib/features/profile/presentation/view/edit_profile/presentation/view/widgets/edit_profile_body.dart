import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/widgets/section_edit_photo.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/widgets/section_personal_info.dart';

import '../../../../../../../../core/consts/routesPage.dart';
import '../../../../../../../../core/consts/strings.dart';
import '../../../../../../../../core/widgets/custom_app_bar.dart';
import 'section_button_edit_profile.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //custom appBar
          CustomAppBar(
            leadingOnTap: () => GoRouter.of(context).pushReplacement(
              homePath,
              extra: 4,
            ),
            title: StringsEn.editProfile,
            trailingWidget: Container(),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //edit photo
          const SectionEditPhoto(),
          //edit personal info
          const SectionPersonalInfo(),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //save
          const SectionButtonEditProfile(),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        ],
      ),
    );
  }
}
