import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/cvs_pdf.dart';
import 'package:jobsque/core/widgets/title_field.dart';
import 'package:jobsque/core/widgets/upload_your_other_file_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/upload_portfolio_cubit/upload_portfolio_cubit.dart';

import '../../../../../core/consts/style.dart';

class UploadPortfolioContentWidget extends StatefulWidget {
  const UploadPortfolioContentWidget({super.key});

  @override
  State<UploadPortfolioContentWidget> createState() =>
      _UploadPortfolioContentWidgetState();
}

class _UploadPortfolioContentWidgetState
    extends State<UploadPortfolioContentWidget> {
  @override
  void initState() {
    BlocProvider.of<UploadPortfolioCubit>(context)..getFiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadPortfolioCubit, UploadPortfolioState>(
      listener: (context, state) {
        if (state is PickedFileFailure) {
          showSnack(
            context,
            message: state.message,
            background: AppConsts.danger500,
          );
        }
      },
      child: Column(
        children: [
          //Upload cv
          TitleField(label: StringsEn.uplaodCv, star: StringsEn.star),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //pdf
          const CvPdfs(),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //other file
          TitleField(label: StringsEn.otherFile),
          const AspectRatio(aspectRatio: AppConsts.aspect40on1),
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
