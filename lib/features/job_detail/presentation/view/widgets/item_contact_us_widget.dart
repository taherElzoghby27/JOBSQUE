import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/consts/strings.dart';
import '../../../../../../core/consts/style.dart';
import '../../../../../core/helper/launch_url.dart';

class ItemContactUsWidget extends StatelessWidget {
  const ItemContactUsWidget({
    super.key,
    required this.keyT,
    required this.value,
  });

  final String keyT;
  final String value;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=>launchUr(context,url: value),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: size.height * .1.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppConsts.neutral200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                keyT,
                style: AppConsts.styleHint14.copyWith(fontSize: 12),
              ),
              FittedBox(
                child: Text(
                  value,
                  style: AppConsts.style14.copyWith(color: AppConsts.neutral900),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
