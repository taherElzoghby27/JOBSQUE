import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/style.dart';

class ItemCompleteProfile extends StatelessWidget {
  const ItemCompleteProfile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.complete,
    this.onTap,
  });

  final String title;
  final String subTitle;
  final bool complete;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .1,
      decoration: complete
          ? AppConsts.decorationRadius8.copyWith(
              border: Border.all(
                color: AppConsts.primary500,
              ),
              color: AppConsts.primary500.withOpacity(.2),
            )
          : AppConsts.decorationRadius8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.check_circle,
              color: complete ? AppConsts.primary500 : AppConsts.neutral400,
            ),
            SizedBox(
              width: size.width * .6.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //jop type
                  Text(
                    title,
                    style: AppConsts.style32.copyWith(fontSize: 16),
                  ),
                  Text(
                    subTitle,
                    style: AppConsts.style16.copyWith(fontSize: 12),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            //radio
            IconButton(
              onPressed: onTap,
              icon: Icon(Icons.arrow_forward_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
