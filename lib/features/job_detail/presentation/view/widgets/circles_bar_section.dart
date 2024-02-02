import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/circle_done_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/circle_widget.dart';

class CirclesBarSection extends StatelessWidget {
  const CirclesBarSection({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(currentPage);
    return SizedBox(
      width: size.width * .86.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //1
          Column(
            children: [
              currentPage == 2 || currentPage == 3 || currentPage == 4
                  ? CircleDoneWidget()
                  : CircleWidget(
                      label: StringsEn.one,
                      color: currentPage == 1
                          ? AppConsts.primary500
                          : AppConsts.neutral400,
                    ),
              SizedBox(height: size.height * .01.h),
              Text(
                StringsEn.bioData,
                style: AppConsts.style12.copyWith(
                  color:
                      currentPage == 2 || currentPage == 3 || currentPage == 4
                          ? AppConsts.primary500
                          : AppConsts.neutral900,
                ),
              ),
            ],
          ),

          ///dashes
          Text(
            StringsEn.dashs,
            style: TextStyle(
              color: currentPage == 2 || currentPage == 3 || currentPage == 4
                  ? AppConsts.primary500
                  : AppConsts.neutral300,
            ),
          ),
          //2
          Column(
            children: [
              currentPage == 3 || currentPage == 4
                  ? CircleDoneWidget()
                  : CircleWidget(
                      label: StringsEn.two,
                      color: currentPage == 2
                          ? AppConsts.primary500
                          : AppConsts.neutral400,
                    ),
              SizedBox(height: size.height * .01.h),
              Text(
                StringsEn.typeOfWork,
                style: AppConsts.style12.copyWith(
                  color:
                      currentPage == 2 || currentPage == 3 || currentPage == 4
                          ? AppConsts.primary500
                          : AppConsts.neutral900,
                ),
              ),
            ],
          ),

          ///dashes
          Text(
            StringsEn.dashs,
            style: TextStyle(
              color: currentPage == 3 || currentPage == 4
                  ? AppConsts.primary500
                  : AppConsts.neutral300,
            ),
          ),
          //3
          Column(
            children: [
               currentPage == 4
                  ? CircleDoneWidget()
                  : CircleWidget(
                      label: StringsEn.three,
                      color: currentPage == 3 || currentPage == 4
                          ? AppConsts.primary500
                          : AppConsts.neutral400,
                    ),
              SizedBox(height: size.height * .01.h),
              Text(
                StringsEn.uploadPortfolio,
                style: AppConsts.style12.copyWith(
                  color: currentPage == 3 || currentPage == 4
                      ? AppConsts.primary500
                      : AppConsts.neutral900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
