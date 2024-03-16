import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/logo_title_icon_widget.dart';
import 'package:jobsque/core/widgets/type_jop_component.dart';

import '../../../../../core/widgets/bookmark_widget.dart';

class ItemRecentJop extends StatelessWidget {
  const ItemRecentJop({
    super.key,
    required this.onTap,
    required this.job,
  });

  final Job job;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspect13on6,
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //logo jopName bookmark
              LogoTitleIconWidget(
                logo: job.image!,
                jopTitle: job.name!,
                company: job.compName!,
                country: job.location!,
                trailing: Expanded(
                  child: BookmarkWidget(job: job),
                ),
              ),
              //full time -remote -design
              Row(
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
                      label: StringsEn.remote,
                      color: AppConsts.primary500,
                    ),
                  ),
                  Spacer(),
                  //salary or txt
                  Row(
                    children: [
                      Text(
                        '\$${job.salary}',
                        style: AppConsts.style16.copyWith(
                          color: AppConsts.success500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '/${StringsEn.month}',
                        style: AppConsts.style14,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
