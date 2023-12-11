import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/widgets/section_edit_photo.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/widgets/section_personal_info.dart';

import '../../../../../core/widgets/customButton.dart';
import '../../../../../core/widgets/small_loading_widget.dart';

class CustomPersonalDetailsComponent extends StatelessWidget {
  const CustomPersonalDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
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
