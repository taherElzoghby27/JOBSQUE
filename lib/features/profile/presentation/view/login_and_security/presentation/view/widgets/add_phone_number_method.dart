import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/consts/strings.dart';
import '../../../../../../../../core/widgets/custom_filter_text_field.dart';
import 'custom_heading_two_step_verifi.dart';

class AddPhoneNumberMethod extends StatelessWidget {
  const AddPhoneNumberMethod({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //Add phone number
          CustomHeadingTwoStepVerifi(
            head: StringsEn.addPhone,
            subHead: StringsEn.weWillSend,
          ),
          //phone number
          CustomFilterTextField(
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
          //enter your password
          CustomFilterTextField(
            label: StringsEn.enterYourPass,
            hint: StringsEn.enterYourPass,
            perfixIcon: Icon(Icons.lock, size: 16.sp),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
