import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_button_icon.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/upload_portfolio_cubit/upload_portfolio_cubit.dart';

class UploadYourOtherFileWidget extends StatelessWidget {
  const UploadYourOtherFileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.w),
      child: DottedBorder(
        dashPattern: [4, 4],
        strokeWidth: 1,
        color: AppConsts.primary500,
        child: Container(
          height: size.height * .275.h,
          color: AppConsts.primary400.withOpacity(.25),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                CustomButtonIcon(
                  onTap: () {
                    BlocProvider.of<UploadPortfolioCubit>(context).addFile();
                    BlocProvider.of<UploadPortfolioCubit>(context).getFiles();
                  },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
