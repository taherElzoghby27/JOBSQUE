import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/widgets/section_otp.dart';

import '../../../../../../../../core/consts/strings.dart';
import 'custom_heading_two_step_verifi.dart';

class VerifyMethod extends StatelessWidget {
  const VerifyMethod({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //Enter the 6 digit code
          CustomHeadingTwoStepVerifi(
            head: StringsEn.enter6Digit,
            subHead: StringsEn.pleaseConfirmCode,
          ),
          SizedBox(height: size.height * .025.h),

          //pin
          SectionOtp(),
          //resend
          Row(
            children: [
              Text(
                StringsEn.resendCode,
                style: AppConsts.style14.copyWith(fontSize: 16),
              ),
              Text(
                ' 45s',
                style: AppConsts.style16White.copyWith(
                  color: AppConsts.primary500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
