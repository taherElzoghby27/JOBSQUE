import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/job_detail/data/models/Pdf.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/upload_portfolio_cubit/upload_portfolio_cubit.dart';

import '../../features/job_detail/presentation/view/widgets/cv_widget.dart';
import '../../features/job_detail/presentation/view/widgets/initial_cv_widget.dart';

class CvPdfs extends StatelessWidget {
  const CvPdfs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadPortfolioCubit, UploadPortfolioState>(
      builder: (context, state) {
        if (state is GetFilesLoading) {
          return LoadingWidget();
        } else if (state is GetFilesSuccess) {
          List<Pdf> cvs = state.cvs;
          return cvs.isEmpty
              ? InitialCvWidget()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CvWidget(pdf: cvs[index]);
                  },
                  itemCount: cvs.length,
                );
        } else if (state is GetFilesFailure) {
          showSnack(context, message: state.message);
        }
        return InitialCvWidget();
      },
    );
  }
}
