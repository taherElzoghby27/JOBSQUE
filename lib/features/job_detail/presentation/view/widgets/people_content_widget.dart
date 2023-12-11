import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/models/job_model.dart';
import 'package:jobsque/core/widgets/jop_type_component_button.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/item_people_jop_detail_widget.dart';

class PeopleContentWidget extends StatelessWidget {
  const PeopleContentWidget({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          SizedBox(height: size.height * .02.h),
          //(num) employee for ()
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //(num) employee for ()
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '6 ${StringsEn.employeeFor}',
                    style: AppConsts.style14.copyWith(
                      color: AppConsts.neutral900,
                    ),
                  ),
                  Text(
                    'UI/UX Design',
                    style: AppConsts.style12.copyWith(
                      color: AppConsts.neutral500,
                    ),
                  ),
                ],
              ),
              //jop
              JopTypeComponent(
                type: StringsEn.ui,
                onTap: () {},
                color: AppConsts.neutral600,
                backColor: AppConsts.neutral100,
              ),
            ],
          ),
          SizedBox(height: size.height * .03.h),
          //people
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => item_people_detail_jop_widget(),
            itemCount: 20,
            separatorBuilder: (BuildContext context, int index) => Divider(
              color: AppConsts.neutral200,
            ),
          ),
        ],
      ),
    );
  }
}
