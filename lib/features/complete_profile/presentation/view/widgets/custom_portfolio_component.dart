import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view/widgets/cvs.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view/widgets/section_add_portfolio.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view_models/portfolio_cubit/portfolio_cubit.dart';

class CustomPortfolioComponent extends StatefulWidget {
  const CustomPortfolioComponent({super.key});

  @override
  State<CustomPortfolioComponent> createState() =>
      _CustomPortfolioComponentState();
}

class _CustomPortfolioComponentState extends State<CustomPortfolioComponent> {
  @override
  void initState() {
    BlocProvider.of<PortfolioCubit>(context).getPortfolios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        return Column(
          children: [
            //Add portfolio here
            SectionAddPortfolio(
              onTap: () async {
                await bloc.addPortfolio();
                await bloc.getPortfolios();
              },
            ),
            const AspectRatio(aspectRatio: AppConsts.aspect16on1),
            //pdfs
            const PortfoliosBlocConsumer(),
          ],
        );
      },
    );
  }
}
