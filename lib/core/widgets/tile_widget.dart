import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({
    super.key,
    required this.label,
    this.textAlign,
    this.trailingOnTap,
    this.trailingLabel,
  });

  final String label;
  final TextAlign? textAlign;
  final void Function()? trailingOnTap;
  final String? trailingLabel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspect16on1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppConsts.neutral200.withOpacity(.4),
          border: Border.symmetric(
            vertical: BorderSide(color: AppConsts.neutral300),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: AppConsts.style14,
                textAlign: textAlign ?? TextAlign.left,
              ),
              TextButton(
                onPressed: trailingOnTap,
                child: Text(
                  trailingLabel ?? '',
                  style: AppConsts.style14.copyWith(
                    color: AppConsts.primary500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
