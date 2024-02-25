import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/customButton.dart';
import 'custom_type_jop_widget.dart';

class RemoteSheetWidget extends StatelessWidget {
  const RemoteSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspect13on9,
      child: Container(
        decoration: AppConsts.decorationSheet,
        child: Padding(
          padding: AppConsts.mainPadding,
          child: Column(
            children: [
              const AspectRatio(aspectRatio: AppConsts.aspect16on1),
              CustomAppBar(
                leadingOnTap: () => GoRouter.of(context).pop(),
                title: StringsEn.on_site,
              ),

              const AspectRatio(aspectRatio: AppConsts.aspect16on2),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  CustomTypeJopWidget(
                    label: StringsEn.remote,
                    labelColor: AppConsts.primary500,
                    onTap: () {},
                  ),
                  CustomTypeJopWidget(
                    label: StringsEn.onSite,
                    labelColor: AppConsts.neutral500,
                    onTap: () {},
                  ),
                  CustomTypeJopWidget(
                    label: StringsEn.hyprid,
                    labelColor: AppConsts.neutral500,
                    onTap: () {},
                  ),
                  CustomTypeJopWidget(
                    label: StringsEn.any,
                    labelColor: AppConsts.primary500,
                    onTap: () {},
                  ),
                ],
              ),

              const AspectRatio(aspectRatio: AppConsts.aspect16on3),

              ///show result
              AspectRatio(
                aspectRatio: AppConsts.aspectRatioButtonAuth,
                child: CustomButton(
                  text: StringsEn.showResult,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
