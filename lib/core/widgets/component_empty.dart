import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class ComponentEmpty extends StatelessWidget {
  const ComponentEmpty({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: AppConsts.decorationNeutral400border16,
    );
  }
}
