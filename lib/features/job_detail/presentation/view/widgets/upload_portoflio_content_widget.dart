import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/cvs_pdf.dart';
import 'package:jobsque/core/widgets/title_field.dart';
import 'package:jobsque/core/widgets/upload_your_other_file_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/upload_portfolio_cubit/upload_portfolio_cubit.dart';

class UploadPortoflioContentWidget extends StatelessWidget {
  const UploadPortoflioContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<UploadPortfolioCubit, UploadPortfolioState>(
      listener: (context, state) {
        if (state is PickedFileFailure) {
          showSnack(context, message: state.message);
        }
      },
      child: Column(
        children: [
          //Upload cv
          TitleField(label: StringsEn.uplaodCv, star: StringsEn.star),
          SizedBox(height: size.height * .01.h),
          //pdf
          CvPdfs(),
          SizedBox(height: size.height * .01.h),
          //other file
          TitleField(label: StringsEn.otherFile),
          SizedBox(height: size.height * .01.h),
          //pdf
          UploadYourOtherFileWidget(
            onTap: () {
              BlocProvider.of<UploadPortfolioCubit>(context).addFile();
              BlocProvider.of<UploadPortfolioCubit>(context).getFiles();
            },
          ),
        ],
      ),
    );
  }
}
