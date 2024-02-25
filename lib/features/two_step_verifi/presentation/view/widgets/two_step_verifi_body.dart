import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view/widgets/add_phone_number_method.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view/widgets/custom_tile_switch_widget.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view/widgets/select_verifi_method.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view/widgets/two_step_verifi_notes_component.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view/widgets/verify_method.dart';
import 'package:jobsque/core/consts/style.dart';
import '../../../../../../../../core/widgets/customButton.dart';
import '../../../../../../../../core/widgets/small_loading_widget.dart';

class TwoStepVerBody extends StatefulWidget {
  const TwoStepVerBody({super.key});

  @override
  State<TwoStepVerBody> createState() => _TwoStepVerBodyState();
}

class _TwoStepVerBodyState extends State<TwoStepVerBody> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          CustomAppBar(
            leadingOnTap: () {
              if (current == 3) {
                setState(() => current = 2);
              } else if (current == 2) {
                setState(() => current = 1);
              } else if (current == 1) {
                setState(() => current = 0);
              } else {
                GoRouter.of(context).pushReplacement(
                  homePath,
                  extra: 4,
                );
              }
            },
            title: StringsEn.twoStepVerifi,
            trailingWidget: Container(),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //secureYourAccount
          current == 0 || current == 1
              ? const CustomTileSwitchWidget()
              : Container(),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          current == 0
              ? const TwoStepVerifiNotesComponent()
              : current == 1
                  ? const SelectVerifiMethod()
                  : current == 2
                      ? const AddPhoneNumberMethod()
                      : const VerifyMethod(),
          const Spacer(),
          //button
          AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth,
            child: Visibility(
              visible: true,
              replacement: const LoadingWidget(),
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
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        ],
      ),
    );
  }
}
