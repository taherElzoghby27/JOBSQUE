import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';

class SectionAboutEdit extends StatelessWidget {
  const SectionAboutEdit({
    super.key,
    required this.leading,
    required this.trailing,
    required this.onTapTrail,
    required this.about,
  });

  final String leading;
  final String trailing;
  final void Function() onTapTrail;
  final String about;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                leading,
                style: AppConsts.style16.copyWith(fontWeight: FontWeight.w500),
              ),
              TextButton(
                onPressed: onTapTrail,
                child: Text(
                  trailing,
                  style: AppConsts.style14.copyWith(
                    color: AppConsts.primary500,
                  ),
                ),
              ),
            ],
          ),
          Text(
            about,
            style: AppConsts.style16.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
