import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_filter_text_field.dart';

class SectionPersonalInfo extends StatelessWidget {
  const SectionPersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Column(
        children: [
          //name
          CustomFilterTextField(
            label: StringsEn.name,
            hint: StringsEn.name,
            onChanged: (String? value) {},
          ),
          SizedBox(height: size.height * .022.w),

          //bio
          CustomFilterTextField(
            label: StringsEn.bio,
            hint: StringsEn.bio,
            onChanged: (String? value) {},
          ),
          SizedBox(height: size.height * .022.w),

          //address
          CustomFilterTextField(
            label: StringsEn.address,
            hint: StringsEn.address,
            onChanged: (String? value) {},
          ),
          SizedBox(height: size.height * .022.w),
          //no handphone
          CustomFilterTextField(
            label: StringsEn.noHandPhone,
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
        ],
      ),
    );
  }
}
