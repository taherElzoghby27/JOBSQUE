import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/widgets/cvs_pdf.dart';

class SectionPdfs extends StatelessWidget {
  const SectionPdfs({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: CvPdfs(),
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: size.height * .01.h,
      ),
      itemCount: 6,
    );
  }
}
