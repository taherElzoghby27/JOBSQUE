import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_circle_button.dart';

class TileLeadingText extends StatelessWidget {
  const TileLeadingText({
    super.key,
    required this.logo,
    required this.txt,
  });

  final String logo;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCircleButton(
          icon: logo,
          color: AppConsts.primary100,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              txt,
              style: AppConsts.style16.copyWith(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
