import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/blur_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/circles_bar_section.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/info_section_jop_detail.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/section_info.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/apply_job_cubit/apply_job_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/changed_page_cubit/changed_page_cubit.dart';

class ApplyJopBody extends StatelessWidget {
  const ApplyJopBody({super.key, required this.data});

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int currentPage = 1;
    bool isLoading = false;
    return BlocConsumer<ChangedPageCubit, ChangedPageState>(
      listener: (context, stateChangedPage) {
        ChangedPageCubit changedBloc = context.read<ChangedPageCubit>();
        if (stateChangedPage is ChangedSuccess) {
          currentPage = changedBloc.currentPage;
        } else if (stateChangedPage is ChangedFailure) {
          showSnack(context, message: stateChangedPage.message);
        }
      },
      builder: (context, stateChangedPage) {
        return BlocConsumer<ApplyJobCubit, ApplyJobState>(
          listener: (context, state) {
            if (state is ApplyJobLoading) {
              isLoading = true;
            } else if (state is ApplyJobSuccess) {
              isLoading = false;
            } else if (state is ApplyJobFailure) {
              isLoading = false;
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
                      Center(
                          child: CirclesBarSection(currentPage: currentPage)),
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
                      child: CustomButton(
                        text: currentPage == 3
                            ? StringsEn.submit
                            : StringsEn.next,
                        onTap: () =>
                            context.read<ChangedPageCubit>().buttonNextSubmit(
                                  context: context,
                                  currentPage: currentPage,
                                  jobId: data[StringsEn.jobId]!,
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
                //loading
                isLoading
                    ? Positioned(
                        bottom: size.height * .5.h,
                        width: size.width,
                        child: Center(child: LoadingWidget()),
                      )
                    : Container(),
              ],
            );
          },
        );
      },
    );
  }
}
