import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view/widgets/section_add_portfolio.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view/widgets/section_pdfs.dart';

import '../../../../../../../../core/consts/strings.dart';

class PortfolioBody extends StatelessWidget {
  const PortfolioBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        SizedBox(height: size.height * .02.h),
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pop(),
          title: StringsEn.portfolio,
          trailingWidget: Container(),
        ),
        //Add portfolio here
        SectionAddPortfolio(),
        SizedBox(height: size.height * .01.h),
        //pdfs
        SectionPdfs(),
      ],
    );
  }
}
