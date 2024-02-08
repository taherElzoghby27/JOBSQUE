import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view/widgets/cvs.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view/widgets/section_add_portfolio.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view_models/portfolio_cubit/portfolio_cubit.dart';

import '../../../../../../../../core/consts/strings.dart';

class PortfolioBody extends StatelessWidget {
  const PortfolioBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<PortfolioCubit, PortfolioState>(
      listener: (context, state) {
        if (state is PickedFileFailure) {
          showSnack(
            context,
            message: state.message,
            background: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        PortfolioCubit bloc = BlocProvider.of<PortfolioCubit>(context);
        return ListView(
          children: [
            const AspectRatio(aspectRatio:AppConsts.aspect16on1),
            CustomAppBar(
              leadingOnTap: () => GoRouter.of(context).pop(),
              title: StringsEn.portfolio,
              trailingWidget: Container(),
            ),
            //Add portfolio here
            SectionAddPortfolio(
              onTap: () async {
                await bloc.addPortfolio();
                await bloc.getPortfolios();
              },
            ),
            SizedBox(height: size.height * .01.h),
            //pdfs
            Portfolios(),
          ],
        );
      },
    );
  }
}
