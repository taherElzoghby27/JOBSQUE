import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/widgets/section_edit_photo.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/widgets/section_personal_info.dart';

import '../../../../../../../../core/consts/strings.dart';
import '../../../../../../../../core/widgets/custom_app_bar.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        SizedBox(height: size.height * .02.h),

        //custom appBar
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pop(),
          title: StringsEn.editProfile,
          trailingWidget: Container(),
        ),
        SizedBox(height: size.height * .02.h),
        //edit photo
        SectionEditPhoto(),
        //edit personal info
        SectionPersonalInfo(),
        SizedBox(height: size.height * .1.h),
        //save
        Center(
          child: SizedBox(
            height: size.height * .055.h,
            width: size.width * .9.w,
            child: Visibility(
              visible: true,
              replacement: LoadingWidget(),
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
