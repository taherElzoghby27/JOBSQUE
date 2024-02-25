import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/customButton.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody({
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
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on7),

          ///icon
          AspectRatio(
            aspectRatio: AppConsts.aspect13on5,
            child: SvgPicture.asset(icon),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          ///title
          Text(
            title,
            style: AppConsts.style24,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),

          ///subtitle
          Padding(
            padding: AppConsts.mainPadding,
            child: Text(
              subTitle,
              style: AppConsts.style14,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on14),

          ///get started
          AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth,
            child: CustomButton(
              text: labelButton,
              onTap: () => GoRouter.of(context).pushReplacement(
                path,
                extra: 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
