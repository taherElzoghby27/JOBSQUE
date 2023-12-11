import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';

import '../../../../../core/consts/strings.dart';

class ItemCvWidget extends StatelessWidget {
  const ItemCvWidget({
    super.key,
    required this.item,
    required this.group,
    this.onChanged,
  });

  final String item;
  final String group;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.w),
      child: Container(
        height: size.height * .1,
        decoration: item == group
            ? AppConsts.decorationRadius8.copyWith(
                border: Border.all(color: AppConsts.primary500),
                color: AppConsts.primary500.withOpacity(.2),
              )
            : AppConsts.decorationRadius8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //jop type
                  Text(
                    item,
                    style: AppConsts.style32.copyWith(fontSize: 16),
                  ),
                  Text(
                    StringsEn.cv_portofolio,
                    style: AppConsts.style14.copyWith(
                      color: AppConsts.neutral500,
                    ),
                  ),
                ],
              ),
              //radio
              Radio<String>(
                activeColor: AppConsts.primary500,
                value: item,
                groupValue: group,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
