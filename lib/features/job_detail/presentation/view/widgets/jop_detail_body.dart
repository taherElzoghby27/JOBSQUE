import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/description_company_people_section_jop_detail.dart';
import 'package:jobsque/core/consts/style.dart';
import 'blur_widget.dart';
import 'jobs_details_body_content_top.dart';

class JopDetailBody extends StatelessWidget {
  const JopDetailBody({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        NestedScrollView(
          headerSliverBuilder: (context, innerBox) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: MediaQuery.sizeOf(context).height * .35,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [StretchMode.blurBackground],
                  background: JobDetailsBodyContentTop(job: job),
                ),
              ),
            ];
          },
          body: DescriptionCompanyPeopleSectionJopDetail(job: job),
        ),

        ///apply now
        Positioned(
          bottom: size.height * .06.h,
          right: 0,
          left: 0,
          child: Center(
            child: Padding(
              padding: AppConsts.allPadding8,
              child: AspectRatio(
                aspectRatio: AppConsts.aspectRatioButtonAuth.sp,
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
            ),
          ),
        ),

        ///
        Positioned(
          bottom: 0,
          width: size.width,
          child: BlurWidget(),
        ),
      ],
    );
  }
}
