import 'package:flutter/material.dart';
import 'package:jobsque/features/home/presentation/view/widgets/suggested_jop_body.dart';

class SuggestedOrRecentJopView extends StatelessWidget {
  const SuggestedOrRecentJopView({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SuggestedOrRecentJopBody(type: type),
      ),
    );
  }
}
