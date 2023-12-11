import 'package:flutter/material.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/search_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchBody(),
      ),
    );
  }
}
