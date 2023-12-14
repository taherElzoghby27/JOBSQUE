import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/blur_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/circles_bar_section.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/info_section_jop_detail.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/section_info.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/apply_job_bloc/apply_job_bloc.dart';

import '../../../../../core/consts/assets.dart';

class ApplyJopBody extends StatelessWidget {
  const ApplyJopBody({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ApplyJobBloc, ApplyJobState>(
      builder: (context, state) {
        int currentPage = 1;
        ApplyJobBloc bloc = BlocProvider.of<ApplyJobBloc>(context);
        if (state is ChangedPageState) {
          currentPage = bloc.currentPage;
        }
        return Stack(
          children: [
            SizedBox(
              height: size.height,
              child: ListView(
                children: [
                  SizedBox(height: size.height * .02.h),

                  //custom appBar
                  CustomAppBar(
                    leadingOnTap: () => GoRouter.of(context).pop(),
                    title: status == StringsEn.notComplete
                        ? StringsEn.appliedJob
                        : StringsEn.applyJob,
                    trailingWidget: Container(),
                  ),
                  //if apply not complete
                  status == StringsEn.notComplete
                      ? Column(
                          children: [
                            SizedBox(height: size.height * .02.h),
                            InfoSectionJopDetail(
                              image: 'image',
                              name: 'name',
                              company: 'company',
                              location: 'location',
                              jobTypeTime: 'jobTypeTime',
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(height: size.height * .02.h),
                  //1  2  3 (circles bar)
                  Center(child: CirclesBarSection(currentPage: currentPage)),
                  SizedBox(height: size.height * .035.h),
                  //info
                  SectionInfo(currentPage: currentPage),
                ],
              ),
            ),
            //next or submit
            Positioned(
              bottom: size.height * .06.h,
              width: size.width,
              child: Center(
                child: SizedBox(
                  height: size.height * .055.h,
                  width: size.width * .9.w,
                  child: Visibility(
                    visible: true,
                    replacement: LoadingWidget(),
                    child: CustomButton(
                      text:
                          currentPage == 3 ? StringsEn.submit : StringsEn.next,
                      onTap: () {
                        bloc.add(NextOrSubmitEvent());
                        if (currentPage > 2) {
                          GoRouter.of(context).pushReplacement(
                            successfullyPagePath,
                            extra: {
                              StringsEn.icon: AppAssets.dataIllu,
                              StringsEn.title:
                                  StringsEn.yourDataHasBeenSuccessfully,
                              StringsEn.subTitle:
                                  StringsEn.youWillGetMessageFromOurTeam,
                              StringsEn.labelButton: StringsEn.backToHome,
                              StringsEn.path: homePath,
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),

            //
            Positioned(
              bottom: 0,
              width: size.width,
              child: BlurWidget(),
            ),
          ],
        );
      },
    );
  }
}
