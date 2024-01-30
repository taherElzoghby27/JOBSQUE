import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view/widgets/add_phone_number_method.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view/widgets/custom_tile_switch_widget.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view/widgets/select_verifi_method.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view/widgets/two_step_verifi_notes_component.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view/widgets/verify_method.dart';

import '../../../../../../../../core/widgets/customButton.dart';
import '../../../../../../../../core/widgets/small_loading_widget.dart';

class TwoStepVerifiBody extends StatefulWidget {
  const TwoStepVerifiBody({super.key});

  @override
  State<TwoStepVerifiBody> createState() => _TwoStepVerifiBodyState();
}

class _TwoStepVerifiBodyState extends State<TwoStepVerifiBody> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(height: size.height * .02.h),
          CustomAppBar(
            leadingOnTap: () {
              if (current == 3) {
                setState(() => current = 2);
              } else if (current == 2) {
                setState(() => current = 1);
              } else if (current == 1) {
                setState(() => current = 0);
              } else {
                GoRouter.of(context).pop();
              }
            },
            title: StringsEn.twoStepVerifi,
            trailingWidget: Container(),
          ),
          SizedBox(height: size.height * .02.h),
          //secureYourAccount
          current == 0 || current == 1
              ? custom_tile_switch_widget()
              : Container(),
          SizedBox(height: size.height * .025.h),

          current == 0
              ? TwoStepVerifiNotesComponent()
              : current == 1
                  ? SelectVerifiMethod()
                  : current == 2
                      ? AddPhoneNumberMethod()
                      : VerifyMethod(),
          Spacer(),
          //button
          SizedBox(
            height: size.height * .055.h,
            width: size.width * .9.w,
            child: Visibility(
              visible: true,
              replacement: LoadingWidget(),
              child: CustomButton(
                text: current == 0 || current == 1
                    ? StringsEn.next
                    : current == 2
                        ? StringsEn.sendCode
                        : StringsEn.verify,
                onTap: () {
                  if (current == 0) {
                    setState(() => current = 1);
                  } else if (current == 1) {
                    setState(() => current = 2);
                  } else if (current == 2) {
                    setState(() => current = 3);
                  }
                },
              ),
            ),
          ),
          SizedBox(height: size.height * .035.w),
        ],
      ),
    );
  }
}
