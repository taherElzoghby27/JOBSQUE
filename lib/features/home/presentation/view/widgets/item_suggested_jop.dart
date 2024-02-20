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
      child: Padding(
        padding: AppConsts.allPadding8,
        child: Container(
          width: size.width * .8.w,
          decoration: BoxDecoration(
            color: AppConsts.primary900,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: AppConsts.allPadding15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //logo jopName
                Row(
                  children: [
                    ///logo
                    Expanded(
                      child: CustomPhoto(image: job.image),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: AppConsts.mainPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///title
                            Text(
                              job.name!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppConsts.style32.copyWith(
                                color: AppConsts.neutral100,
                                fontSize: 18,
                              ),
                            ),

                            ///company.country
                            Text(
                              '${job.compName}.${job.location}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppConsts.styleHint14.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///bookmark
                    BookmarkWidget(
                      job: job,
                      color: AppConsts.neutral100,
                    ),
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
                    Expanded(
                      child: Row(
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
                    ),
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: AppConsts.aspectRatioButtonApply,
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
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
