import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/customButton.dart';

class SuccessfullView extends StatelessWidget {
  const SuccessfullView({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.labelButton,
    required this.path,
  });

  final String icon;
  final String title;
  final String subTitle;
  final String labelButton;
  final String path;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              children: [
                SizedBox(height: size.height * .225.h),

                ///icon
                SvgPicture.asset(icon, height: size.height * .15),
                const AspectRatio(aspectRatio:AppConsts.aspect16on1),

                ///title
                Text(
                  title,
                  style: AppConsts.style24,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),

                ///subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    subTitle,
                    style: AppConsts.style14,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: size.height * .3.h),

                ///get started
                SizedBox(
                  height: size.height * .055.h,
                  width: size.width * .9.w,
                  child: CustomButton(
                    text: labelButton,
                    onTap: () => GoRouter.of(context).pushReplacement(path),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
