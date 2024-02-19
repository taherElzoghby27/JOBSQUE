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
    this.leadingOnTap,
  });

  final String label;
  final TextAlign? textAlign;
  final void Function()? trailingOnTap;
  final void Function()? leadingOnTap;
  final String? trailingLabel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspect20on2,
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
              TextButton(
                onPressed: leadingOnTap,
                child: Text(
                  label,
                  style: AppConsts.style14,
                  textAlign: textAlign ?? TextAlign.left,
                ),
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
