import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.leadingOnTap,
    required this.title,
    this.trailingWidget,
    this.image,
    this.color = AppConsts.neutral900,
  });

  final void Function()? leadingOnTap;
  final String title;
  final Widget? trailingWidget;
  final String? image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: AppConsts.aspect20on2,
      child: Padding(
        padding: AppConsts.padding8Horiz,
        child: Row(
          children: [
            ///arrow back
            Expanded(
              child: leadingOnTap == null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        image!,
                        height: size.height * .075.h,
                      ),
                    )
                  : IconButton(
                      onPressed: leadingOnTap,
                      icon: Icon(Icons.arrow_back, color: color),
                    ),
            ),

            Expanded(
              flex: 8,
              child: Text(
                title,
                style: AppConsts.style20.copyWith(
                  color: color,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            ///reset
            Expanded(
              child: trailingWidget ?? Container(width: 50),
            ),
          ],
        ),
      ),
    );
  }
}
