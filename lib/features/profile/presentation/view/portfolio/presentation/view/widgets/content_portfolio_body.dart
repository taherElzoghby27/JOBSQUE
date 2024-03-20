import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view_models/portfolio_cubit/portfolio_cubit.dart';

import 'portfolios_bloc_consumer.dart';
import 'section_add_portfolio.dart';

class ContentPortfolioBody extends StatelessWidget {
  const ContentPortfolioBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          //Add portfolio here
          SectionAddPortfolio(
            onTap: () async {
              PortfolioCubit bloc = BlocProvider.of<PortfolioCubit>(context);
              await bloc.addPortfolio();
            },
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //pdfs
          const PortfoliosBlocConsumer(),
        ],
      ),
    );
  }
}
