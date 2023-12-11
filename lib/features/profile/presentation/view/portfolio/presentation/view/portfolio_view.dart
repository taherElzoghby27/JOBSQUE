import 'package:flutter/material.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view/widgets/portfolio_body.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PortfolioBody(),
      ),
    );
  }
}
