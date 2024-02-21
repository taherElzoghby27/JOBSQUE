import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/component_empty.dart';

class LoadingWidgetJobsSuggestedRecentBody extends StatelessWidget {
  const LoadingWidgetJobsSuggestedRecentBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: AppConsts.decorationNeutral300border16,
      child: Padding(
        padding: AppConsts.allPadding8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(color: AppConsts.neutral400),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: AppConsts.aspect16on1,
                        child: ComponentEmpty(),
                      ),
                      AspectRatio(aspectRatio: AppConsts.aspect16on1),
                      AspectRatio(
                        aspectRatio: AppConsts.aspect16on1,
                        child: ComponentEmpty(),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: AppConsts.allPadding8,
                    child: AspectRatio(
                      aspectRatio: AppConsts.aspect16on5,
                      child: ComponentEmpty(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: AppConsts.allPadding8,
                    child: AspectRatio(
                      aspectRatio: AppConsts.aspect16on5,
                      child: ComponentEmpty(),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: size.height * .0005.h),
          ],
        ),
      ),
    );
  }
}
