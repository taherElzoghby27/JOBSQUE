import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_button_icon.dart';

class UploadYourOtherFileWidget extends StatelessWidget {
  const UploadYourOtherFileWidget({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: [4, 4],
      strokeWidth: 1,
      color: AppConsts.primary500,
      child: AspectRatio(
        aspectRatio: AppConsts.aspect13on9,
        child: Container(
          color: AppConsts.primary400.withOpacity(.25),
          child: Padding(
            padding: AppConsts.allPadding8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //upload logo
                SvgPicture.asset(AppAssets.uplaodDoc),
                //Upload your other file
                Text(
                  StringsEn.uploadYourOtherFile,
                  style: AppConsts.style32.copyWith(fontSize: 18),
                ),
                //info file
                Text(
                  StringsEn.maxFile,
                  style: AppConsts.style12.copyWith(
                    color: AppConsts.neutral500,
                  ),
                ),
                //button
                AspectRatio(
                  aspectRatio: AppConsts.aspectRatioButtonAuth,
                  child: CustomButtonIcon(
                    onTap: onTap,
                    label: Text(
                      StringsEn.addFile,
                      style: AppConsts.style16White.copyWith(
                        color: AppConsts.primary500,
                      ),
                    ),
                    icon: Icon(
                      Icons.ios_share_rounded,
                      color: AppConsts.primary500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
