import 'package:flutter/material.dart';
import 'package:jobsque/features/home/presentation/view/widgets/suggested_jop_body.dart';

class SuggestedJopView extends StatelessWidget {
  const SuggestedJopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SuggestedJopBody(),
      ),
    );
  }
}
