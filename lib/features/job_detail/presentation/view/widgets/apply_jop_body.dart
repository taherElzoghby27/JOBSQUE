import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/blur_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/circles_bar_section.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/info_section_jop_detail.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/section_info.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/changed_page_cubit/changed_page_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/upload_portfolio_cubit/upload_portfolio_cubit.dart';

import '../../../../../core/consts/assets.dart';

class ApplyJopBody extends StatelessWidget {
  const ApplyJopBody({super.key, required this.data});

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int currentPage = 1;
    bool isLoading = false;
    return BlocConsumer<ChangedPageCubit, ChangedPageState>(
      listener: (context, state) {
        if (state is ChangedLoading) {
          isLoading = true;
        } else if (state is ChangedSuccess) {
          currentPage = state.current;
          isLoading = false;
        } else if (state is ChangedFailure) {
          isLoading = false;
          showSnack(context, message: state.message);
        }
      },
      builder: (context, state) {
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
                    title: data[StringsEn.status] == StringsEn.notComplete
                        ? StringsEn.appliedJob
                        : StringsEn.applyJob,
                    trailingWidget: Container(),
                  ),
                  //if apply not complete
                  data[StringsEn.status] == StringsEn.notComplete
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
                    visible: !isLoading,
                    replacement: LoadingWidget(),
                    child: CustomButton(
                      text:
                          currentPage == 3 ? StringsEn.submit : StringsEn.next,
                      onTap: () => buttonNextSubmit(
                        context: context,
                        currentPage: currentPage,
                      ),
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

  //button (next or submit)
  buttonNextSubmit({required BuildContext context, required int currentPage}) {
    //next->next->submit
    context.read<ChangedPageCubit>().nextOrSubmit(
          context,
          jobId: data[StringsEn.jobId]!,
        );
    //check if in last page or not
    checkInLastPageOrNot(context: context, currentPage: currentPage);
  }

//check if in last page or not
  checkInLastPageOrNot(
      {required BuildContext context, required int currentPage}) {
    if (currentPage > 2 &&
        context.read<UploadPortfolioCubit>().checkCvsIsCompletedOrNot()) {
      GoRouter.of(context).pushReplacement(
        successfullyPagePath,
        extra: {
          StringsEn.icon: AppAssets.dataIllu,
          StringsEn.title: StringsEn.yourDataHasBeenSuccessfully,
          StringsEn.subTitle: StringsEn.youWillGetMessageFromOurTeam,
          StringsEn.labelButton: StringsEn.backToHome,
          StringsEn.path: homePath,
        },
      );
    } else {
      showSnack(context, message: StringsEn.eenterCv);
    }
  }
}
