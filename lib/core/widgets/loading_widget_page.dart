import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class LoadingWidgetPage extends StatelessWidget {
  const LoadingWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(decoration: AppConsts.decorationLoadingMap),
        const CircularProgressIndicator(
          color: AppConsts.primary500,
        ),
      ],
    );
  }
}
