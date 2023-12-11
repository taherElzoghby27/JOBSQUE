import 'package:flutter/material.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/features/onBoarding/presentation/view/widgets/on_boarding_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FadeAnimation(
          millSeconds: 1000,
          child: OnBoardingBody(),
        ),
      ),
    );
  }
}
