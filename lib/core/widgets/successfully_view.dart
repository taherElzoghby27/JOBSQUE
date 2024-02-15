import 'package:flutter/material.dart';
import 'package:jobsque/core/widgets/success_body.dart';

class SuccessfullView extends StatelessWidget {
  const SuccessfullView({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.labelButton,
    required this.path,
  });

  final String icon;
  final String title;
  final String subTitle;
  final String labelButton;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SuccessBody(
          icon: icon,
          title: title,
          subTitle: subTitle,
          labelButton: labelButton,
          path: path,
        ),
      ),
    );
  }
}
