import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/type_jop_component.dart';

import '../../../../../core/widgets/custom_photo.dart';

class InfoSectionJopDetail extends StatelessWidget {
  const InfoSectionJopDetail({
    super.key,
    required this.image,
    required this.name,
    required this.company,
    required this.location,
    required this.jobTypeTime,
  });

  final String image;
  final String name;
  final String company;
  final String location;
  final String jobTypeTime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> position = location.split(',');
    int sizeLocation = position.length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //company logo
        CustomPhoto(
          image: image,
          height: size.height * .055.h,
        ),
        SizedBox(height: size.height * .01.h),
        //title
        SizedBox(
          width: size.width * .65.w,
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppConsts.style32.copyWith(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: size.height * .01.h),
        //company.country
        SizedBox(
          width: size.width * .425.w,
          child: Text(
            '$company.${position[0]},${position[sizeLocation - 2]},${position[sizeLocation - 1]}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppConsts.styleHint14.copyWith(
              fontSize: 12,
              color: AppConsts.neutral700,
            ),
          ),
        ),
        SizedBox(height: size.height * .02.h),
        //senior fulltime onsite
        SizedBox(
          width: size.width * .6.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TypeJopComponent(
                  label: jobTypeTime,
                  color: AppConsts.primary500,
                ),
              ),
              Expanded(
                child: TypeJopComponent(
                  label: StringsEn.onSite,
                  color: AppConsts.primary500,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        SizedBox(height: size.height * .01.h),
      ],
    );
  }
}
