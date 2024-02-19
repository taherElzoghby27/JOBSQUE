import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/data.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_button_three_widget.dart';
import 'package:jobsque/core/widgets/custom_divider.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';

class SectionGeneral extends StatelessWidget {
  const SectionGeneral({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TileWidget(label: StringsEn.general),
        const AspectRatio(aspectRatio: AppConsts.aspect40on1),
        Column(
          children: generalDataProfile
              .map(
                (Map<String, dynamic> item) => Column(
                  children: [
                    Padding(
                      padding: AppConsts.allPadding8,
                      child: CustomButtonThreeWidget(
                        leading: item[StringsEn.leading],
                        title: item[StringsEn.title],
                        trailing: item[StringsEn.trailing],
                        onTap: () => GoRouter.of(context).push(
                          item[StringsEn.path],
                        ),
                        decoration: BoxDecoration(),
                      ),
                    ),
                    const CustomDivider(),
                  ],
                ),
              )
              .toList(),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect40on1),
      ],
    );
  }
}
