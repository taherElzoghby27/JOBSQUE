import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';

class InitialCvWidget extends StatelessWidget {
  const InitialCvWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(StringsEn.noCvs, style: AppConsts.style16);
  }
}
