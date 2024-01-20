import 'package:flutter/material.dart';

class ChipResponseApplied extends StatelessWidget {
  const ChipResponseApplied({
    super.key,
    required this.label,
    required this.color,
    required this.background,
  });

  final String label;
  final Color color;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: color),
      ),
      side: BorderSide(width: 0, color: background),
      backgroundColor: background,
    );
  }
}
