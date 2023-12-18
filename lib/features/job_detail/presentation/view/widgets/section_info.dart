import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/bio_data_content_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/custom_title_subtitle_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/type_of_work_content_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/upload_portoflio_content_widget.dart';

class SectionInfo extends StatelessWidget {
  const SectionInfo({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title - subTitle
            CustomTitleSubTitleWidget(
              title: currentPage == 1
                  ? StringsEn.bioData
                  : currentPage == 2
                      ? StringsEn.typeOfWork
                      : StringsEn.uploadPortfolio,
              subTitle: StringsEn.fillInYourBioData,
            ),
            SizedBox(height: size.height * .03.w),

            currentPage == 1
                ? BioDataContentWidget()
                : currentPage == 2
                    ? TypeOfWorkContentWidget()
                    : UploadPortoflioContentWidget(),
            SizedBox(height: size.height * .12.h),
          ],
        ),
      ),
    );
  }
}
