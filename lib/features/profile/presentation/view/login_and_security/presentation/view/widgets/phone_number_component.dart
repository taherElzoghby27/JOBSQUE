import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/profile/presentation/view/notification/presentation/view/widgets/custom_tile_switch.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/custom_filter_text_field.dart';

class PhoneNumberComponent extends StatelessWidget {
  const PhoneNumberComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          SizedBox(height: size.height * .01.h),
          //phone number
          CustomFilterTextField(
            label: StringsEn.mainPhoneNumber,
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
          SizedBox(height: size.height * .015.h),
          //Use the phone number to reset your password
          CustomTileSwitch(
            label: StringsEn.usePhoneNumber,
            value: true,
            styleText: AppConsts.style16.copyWith(color: AppConsts.neutral900),
          ),
        ],
      ),
    );
  }
}
