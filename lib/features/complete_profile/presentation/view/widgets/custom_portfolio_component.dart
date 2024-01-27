import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/widgets/cvs_pdf.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view/widgets/section_add_portfolio.dart';

class CustomPortfolioComponent extends StatelessWidget {
  const CustomPortfolioComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        //Add portfolio here
        SectionAddPortfolio(
          onTap: () {},
        ),
        SizedBox(height: size.height * .01.h),
        //pdfs
        CvPdfs(),
      ],
    );
  }
}
