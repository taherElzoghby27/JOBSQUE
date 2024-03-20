import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/title_field.dart';

import '../../../../../../../../core/consts/strings.dart';
import '../../../../../../../../core/widgets/upload_your_other_file_widget.dart';

class SectionAddPortfolio extends StatelessWidget {
  const SectionAddPortfolio({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleField(label: StringsEn.addPortfolioHere),
        const AspectRatio(aspectRatio: AppConsts.aspect40on1),
        //pdf
        UploadYourOtherFileWidget(onTap: onTap),
      ],
    );
  }
}
