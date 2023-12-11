import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/custom_filter_text_field.dart';

class ChangePassComponent extends StatelessWidget {
  const ChangePassComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          SizedBox(height: size.height * .01.h),
          //enterYourOldPass
          CustomFilterTextField(
            label: StringsEn.enterYourOldPass,
            hint: StringsEn.enterYourOldPass,
            perfixIcon: Icon(Icons.lock, size: 16.sp),
          ),
          SizedBox(height: size.height * .01.h),
          //enterNewPass
          CustomFilterTextField(
            label: StringsEn.enterNewPass,
            hint: StringsEn.enterNewPass,
            perfixIcon: Icon(Icons.lock, size: 16.sp),
          ),
          SizedBox(height: size.height * .01.h),
          //confirmNewPass
          CustomFilterTextField(
            label: StringsEn.confirmNewPass,
            hint: StringsEn.confirmNewPass,
            perfixIcon: Icon(Icons.lock, size: 16.sp),
          ),
        ],
      ),
    );
  }
}
