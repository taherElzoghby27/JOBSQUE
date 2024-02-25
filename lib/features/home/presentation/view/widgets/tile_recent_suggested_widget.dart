import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';

class TileRecentOrSuggested extends StatelessWidget {
  const TileRecentOrSuggested({
    super.key,
    required this.label,
    required this.onTapViewAll,
  });

  final String label;
  final void Function() onTapViewAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:AppConsts.padding10h8v,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppConsts.style32.copyWith(fontSize: 18),
          ),
          TextButton(
            onPressed: onTapViewAll,
            child: Text(
              StringsEn.viewAll,
              style: AppConsts.style14.copyWith(
                color: AppConsts.primary500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
