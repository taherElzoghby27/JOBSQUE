import 'package:flutter/material.dart';
import 'package:jobsque/features/profile/presentation/view/language/presentation/view/widgets/languages_body.dart';

class LanguagesView extends StatelessWidget {
  const LanguagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: LanguagesBody(),
      ),
    );
  }
}
