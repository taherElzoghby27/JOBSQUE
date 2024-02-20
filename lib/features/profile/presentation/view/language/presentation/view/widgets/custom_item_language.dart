import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class CustomItemLanguage extends StatelessWidget {
  const CustomItemLanguage({
    super.key,
    required this.logo,
    required this.label,
    required this.value,
    required this.group,
    this.onChanged,
  });

  final String logo;
  final String label;
  final String value;
  final String group;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.allPadding8,
      child: Row(
        children: [
          //logo
          Image.asset(logo, height: 30),
          const Spacer(flex: 1),
          //name
          Text(
            label,
            style: AppConsts.style32.copyWith(fontSize: 16),
          ),
          const Spacer(flex: 6),
          //radio
          Radio<String>(
            activeColor: AppConsts.primary500,
            value: value,
            groupValue: group,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
