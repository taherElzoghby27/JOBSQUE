import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view/widgets/portfolio_body.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view_models/portfolio_cubit/portfolio_cubit.dart';

class PortfolioView extends StatefulWidget {
  const PortfolioView({super.key});

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
  @override
  void initState() {
    BlocProvider.of<PortfolioCubit>(context).getPortfolios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: PortfolioBody(),
      ),
    );
  }
}
