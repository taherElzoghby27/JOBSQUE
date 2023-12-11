import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/custom_filter_text_field.dart';

class BioDataContentWidget extends StatelessWidget {
  const BioDataContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        //full name
        CustomFilterTextField(
          label: StringsEn.fullName,
          star: StringsEn.star,
          hint: StringsEn.fullName,
          perfixIcon: Icon(
            Icons.person,
            size: 16.sp,
          ),
        ),
        SizedBox(height: size.height * .022.w),

        //email
        CustomFilterTextField(
          label: StringsEn.email,
          star: StringsEn.star,
          hint: StringsEn.email,
          perfixIcon: Icon(
            Icons.mail,
            size: 16.sp,
          ),
        ),
        SizedBox(height: size.height * .022.w),

        //phone number
        CustomFilterTextField(
          label: StringsEn.noHandPhone,
          star: StringsEn.star,
          hint: StringsEn.phone,
          perfixIcon: CountryCodePicker(
            flagWidth: 25,
            onChanged: (CountryCode value) {},
            showDropDownButton: true,
            showCountryOnly: true,
            showOnlyCountryWhenClosed: true,
            showFlagDialog: true,
            hideMainText: true,
            showFlagMain: true,
          ),
          onChanged: (String? value) {},
        ),
        SizedBox(height: size.height * .022.w),
      ],
    );
  }
}
