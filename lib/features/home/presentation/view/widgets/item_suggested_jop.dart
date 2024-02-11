import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/bookmark_widget.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/type_jop_component.dart';

import '../../../../../core/widgets/custom_photo.dart';

class ItemSuggestedJop extends StatelessWidget {
  const ItemSuggestedJop({
    super.key,
    required this.job,
    required this.onTap,
  });

  final Job job;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: AppConsts.aspect13on9,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppConsts.primary900,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //logo jopName
                  Row(
                    children: [
                      ///logo
                      CustomPhoto(
                        image: job.image!,
                        height: size.height * .055.h,
                      ),
                      Spacer(),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///title
                          SizedBox(
                            width: size.width * .4.w,
                            child: Text(
                              job.name!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppConsts.style32.copyWith(
                                color: AppConsts.neutral100,
                                fontSize: 18,
                              ),
                            ),
                          ),

                          ///company.country
                          SizedBox(
                            width: size.width * .4.w,
                            child: Text(
                              '${job.compName}.${job.location}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppConsts.styleHint14.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),

                      ///bookmark
                      BookmarkWidget(job: job, color: AppConsts.neutral100),
                    ],
                  ),
                  //full time -remote -design
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: TypeJopComponent(
                          label: job.jobTimeType!,
                          color: AppConsts.neutral100,
                        ),
                      ),
                      Expanded(
                        child: TypeJopComponent(
                          label: StringsEn.remote,
                          color: AppConsts.neutral100,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  //salary - apply jop
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '\$${job.salary}',
                            style: AppConsts.style20,
                          ),
                          Text(
                            '/${StringsEn.month}',
                            style: AppConsts.style14,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .045.h,
                        width: size.width * .28.w,
                        child: CustomButton(
                          text: StringsEn.applyNow,
                          onTap: () => GoRouter.of(context).push(
                            applyJopPath,
                            extra: {
                              StringsEn.status: StringsEn.notOpen,
                              StringsEn.jobId: job.id.toString(),
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
