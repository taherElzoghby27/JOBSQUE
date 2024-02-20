import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../../../core/consts/style.dart';

class SectionOtp extends StatelessWidget {
  const SectionOtp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      // key: cont.formKey,
      child: Padding(
        padding:AppConsts.padding10h8v,
        child: AspectRatio(
          aspectRatio: AppConsts.aspect16on3,
          child: PinCodeTextField(
            appContext: context,
            //pastedTextStyle: AppConsts.pastedTextStyle,
            length: 6,
            animationType: AnimationType.fade,
            validator: (v) {
              if (v!.length < 6) {
                return StringsEn.validator;
              } else {
                return null;
              }
            },
            pinTheme: PinTheme(
              activeColor: AppConsts.primary500.withOpacity(.5),
              selectedColor: AppConsts.neutral200,
              inactiveColor: AppConsts.neutral200,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8),
              fieldWidth: size.width * .115.w,
              activeBorderWidth: 1,
              inactiveBorderWidth: 1,
            ),
            cursorColor: AppConsts.primary500,
            animationDuration: const Duration(milliseconds: 300),
            //errorAnimationController: cont.errorController,
            controller: TextEditingController(),
            keyboardType: TextInputType.number,
            onCompleted: (v) {
              debugPrint("Completed");
            },
            onChanged: (value) {},
            onSubmitted: (value) {},
            beforeTextPaste: (text) {
              debugPrint("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          ),
        ),
      ),
    );
  }
}
