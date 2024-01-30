import 'package:flutter/cupertino.dart';
import 'package:jobsque/core/consts/strings.dart';

import '../../../../../../../../core/consts/assets.dart';
import 'tile_leading_txt.dart';

class TwoStepVerifiNotesComponent extends StatelessWidget {
  const TwoStepVerifiNotesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TileLeadingText(
          logo: AppAssets.lockSvg,
          txt: StringsEn.twoStepProvides,
        ),
        TileLeadingText(
          logo: AppAssets.lockSvg,
          txt: StringsEn.addingPhoneNumOr,
        ),
      ],
    );
  }
}
