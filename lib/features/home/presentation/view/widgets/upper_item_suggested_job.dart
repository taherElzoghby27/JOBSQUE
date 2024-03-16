
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/custom_photo.dart';

import '../../../../../core/widgets/bookmark_widget.dart';

class UpperItemSuggestedJob extends StatelessWidget {
  const UpperItemSuggestedJob({
    super.key,
    required this.job,
  });

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
