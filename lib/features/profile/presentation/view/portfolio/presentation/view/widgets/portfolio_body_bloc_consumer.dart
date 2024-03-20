import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view_models/portfolio_cubit/portfolio_cubit.dart';

import '../../../../../../../../core/consts/strings.dart';
import 'content_portfolio_body.dart';

class PortfolioBodyBlocConsumer extends StatelessWidget {
  const PortfolioBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PortfolioCubit, PortfolioState>(
      listener: (context, state) {
        if (state is PickedFileFailure) {
          showSnack(
            context,
            message: state.message,
            background: AppConsts.danger500,
          );
        }
      },
      child: ListView(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          CustomAppBar(
            leadingOnTap: () => GoRouter.of(context).pushReplacement(
              homePath,
              extra: 4,
            ),
            title: StringsEn.portfolio,
            trailingWidget: Container(),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          const ContentPortfolioBody(),
        ],
      ),
    );
  }
}
