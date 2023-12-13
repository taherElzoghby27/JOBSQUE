import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/description_company_people_section_jop_detail.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/info_section_jop_detail.dart';

import '../../../../../core/widgets/bookmark_widget.dart';
import '../../../../home/presentation/view_models/saved_cubit/saved_cubit.dart';
import 'blur_widget.dart';

class JopDetailBody extends StatelessWidget {
  const JopDetailBody({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBox) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: size.height * .33.h,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        SizedBox(height: size.height * .02.h),

                        ///custom appBar
                        CustomAppBar(
                          leadingOnTap: () => GoRouter.of(context).pushReplacement(homePath),
                          title: StringsEn.jobDetail,
                          trailingOnTap: () {},
                          trailingWidget: BookmarkWidget(job:job),
                        ),
                        SizedBox(height: size.height * .02.h),

                        ///title - company -country
                        InfoSectionJopDetail(
                          image: job.image!,
                          name: job.name!,
                          company: job.compName!,
                          location: job.location!,
                          jobTypeTime: job.jobTimeType!,
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: DescriptionCompanyPeopleSectionJopDetail(job: job),
          ),
        ),

        ///apply now
        Positioned(
          bottom: size.height * .06.h,
          width: size.width,
          child: Center(
            child: SizedBox(
              height: size.height * .055.h,
              width: size.width * .9.w,
              child: CustomButton(
                text: StringsEn.applyNow,
                onTap: () => GoRouter.of(context).push(
                  applyJopPath,
                  extra: StringsEn.notOpen,
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
