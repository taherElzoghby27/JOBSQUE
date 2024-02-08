import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          TitleField(label: StringsEn.addPortfolioHere),
          SizedBox(height: size.height * .01.h),
          //pdf
          UploadYourOtherFileWidget(onTap: onTap),
        ],
      ),
    );
  }
}
