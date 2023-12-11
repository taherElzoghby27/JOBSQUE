import 'package:flutter/material.dart';

import '../../../../../core/consts/style.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
  });

  final String label;
  final bool value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: AppConsts.primary500,
          value: value,
          onChanged: onChanged,
        ),
        Text(
          label,
          style: AppConsts.style24.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
