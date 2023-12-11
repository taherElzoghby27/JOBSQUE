import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/cv_pdf_widget.dart';
import 'package:jobsque/core/widgets/title_field.dart';
import 'package:jobsque/core/widgets/upload_your_other_file_widget.dart';

class UploadPortoflioContentWidget extends StatelessWidget {
  const UploadPortoflioContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        //Upload cv
        TitleField(label: StringsEn.uplaodCv, star: StringsEn.star),
        SizedBox(height: size.height * .01.h),
        //pdf
        CvPdfWidget(),
        SizedBox(height: size.height * .01.h),
        //other file
        TitleField(label: StringsEn.otherFile),
        SizedBox(height: size.height * .01.h),
        //pdf
        UploadYourOtherFileWidget()
      ],
    );
  }
}
