
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.label,
    this.hintTrailing,
    this.onTap,
  });

  final String label;
  final String? hintTrailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppConsts.style16.copyWith(color: AppConsts.neutral900),
            ),
            Row(
              children: [
                hintTrailing == null
                    ? Container()
                    : Text(
                        hintTrailing!,
                        style: AppConsts.style16.copyWith(fontSize: 14),
                      ),
                Icon(Icons.arrow_forward_rounded),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
