
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/custom_filter_text_field.dart';

class EmailAddressPage extends StatelessWidget {
  const EmailAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          SizedBox(height: size.height * .01.h),
          //email
          CustomFilterTextField(
            label: StringsEn.mainEmailAddress,
            hint: StringsEn.email,
            perfixIcon: Icon(
              Icons.mail,
              size: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
