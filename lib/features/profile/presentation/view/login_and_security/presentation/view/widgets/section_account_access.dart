import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/data.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_divider.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/widgets/custom_tile.dart';

class SectionAccountAccess extends StatelessWidget {
  const SectionAccountAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TileWidget(label: StringsEn.accoutAccess),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        //
        Column(
          children: accountAccess
              .map(
                (item) => Column(
                  children: [
                    CustomTile(
                      label: item[StringsEn.title],
                      hintTrailing: item[StringsEn.trailing],
                      onTap: (item[StringsEn.path] as String).isNotEmpty
                          ? () => GoRouter.of(context).push(
                                item[StringsEn.path],
                                extra: item[StringsEn.extra],
                              )
                          : () {},
                    ),
                    const CustomDivider(),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
