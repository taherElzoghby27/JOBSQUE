import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/type_jop_component.dart';

import '../../../../../core/widgets/custom_photo.dart';

class InfoSectionJopDetail extends StatefulWidget {
  const InfoSectionJopDetail({super.key, required this.job});

  final Job job;

  @override
  State<InfoSectionJopDetail> createState() => _InfoSectionJopDetailState();
}

class _InfoSectionJopDetailState extends State<InfoSectionJopDetail> {
  late Job job;
  List<String> position = [];
  int sizeLocation = 0;

  @override
  void initState() {
    job=widget.job;
    position = job.location!.split(',');
    sizeLocation = position.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //company logo
        CustomPhoto(
          image: job.image!,
          height: size.height * .055.h,
        ),
        SizedBox(height: size.height * .01.h),
        //title
        SizedBox(
          width: size.width * .65.w,
          child: Text(
            job.name!,
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
            '${job.compName}.${position[0]},${position[sizeLocation - 2]},${position[sizeLocation - 1]}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppConsts.styleHint14.copyWith(
              fontSize: 12,
              color: AppConsts.neutral700,
            ),
          ),
        ),
        const AspectRatio(aspectRatio:AppConsts.aspect40on1),
        //senior fulltime onsite
        SizedBox(
          width: size.width * .6.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TypeJopComponent(
                  label: job.jobTimeType!,
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
