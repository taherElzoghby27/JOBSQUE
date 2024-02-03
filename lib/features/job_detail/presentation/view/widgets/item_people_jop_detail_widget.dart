import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';

class ItemPeopleDetailJobWidget extends StatelessWidget {
  const ItemPeopleDetailJobWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/person.png'),
          //name-position
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dimas Adi Saputro',
                style: AppConsts.style14.copyWith(
                  color: AppConsts.neutral900,
                ),
              ),
              Text(
                'Senior UI/UX Designer at Twitter',
                style: AppConsts.style12.copyWith(
                  color: AppConsts.neutral500,
                ),
              ),
            ],
          ),
          //work-during
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                StringsEn.workDuring,
                style: AppConsts.style12.copyWith(
                  color: AppConsts.neutral500,
                ),
              ),
              Text(
                '4 Years',
                style: AppConsts.style12.copyWith(
                  color: AppConsts.primary500,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
