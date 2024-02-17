
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_circle_button.dart';

import '../../../../../core/widgets/text_field.dart';

class SectionSendMessage extends StatelessWidget {
  const SectionSendMessage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:AppConsts.padding10h8v,
      child: Row(
        children: [
          SizedBox(width: size.width * .01.w),
          //asset
          CustomCircleButton(
            icon: AppAssets.assets,
            onTap: () {},
          ),
          SizedBox(width: size.width * .05.w),
          //write a message
          Expanded(
            child: CustomTextField(
              hint: StringsEn.writeAMessage,
              controller: TextEditingController(),
            ),
          ),
          SizedBox(width: size.width * .05.w),
          //microphone
          CustomCircleButton(
            icon: AppAssets.micro,
            onTap: () {},
          ),
          SizedBox(width: size.width * .01.w),
        ],
      ),
    );
  }
}
