import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/handle_image.dart';
import 'package:jobsque/features/job_detail/data/models/Pdf.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/upload_portfolio_cubit/upload_portfolio_cubit.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view_models/portfolio_cubit/portfolio_cubit.dart';

import '../../../../../core/helper/launch_url.dart';
import '../../../../../core/models/user_profile_model/portfolio.dart';
import 'middle_cv_widget.dart';

class CvWidget extends StatelessWidget {
  const CvWidget({
    super.key,
    this.pdf,
    this.portfolio,
  });

  final Pdf? pdf;
  final PortfolioModel? portfolio;

  @override
  Widget build(BuildContext context) {
    //deleteMethod
    deleteMethod() async {
      if (pdf == null) {
        print(portfolio!.id);
        final bloc = BlocProvider.of<PortfolioCubit>(context);
        await bloc.deletePortfolio(
          idPortfolio: portfolio!.id!,
        );
        await bloc.getPortfolios();
      } else {
        final bloc = BlocProvider.of<UploadPortfolioCubit>(context);
        await bloc.deleteFile(pdf: pdf!);
      }
    }

//open pdf
    launchUrlPdf() async {
      await launchUr(
        context,
        url: pdf == null ? portfolio!.cvFile!.path : pdf!.path!,
      );
    }

    return InkWell(
      onTap: launchUrlPdf,
      borderRadius: AppConsts.radius8,
      child: Padding(
        padding: AppConsts.padding10h8v,
        child: AspectRatio(
          aspectRatio: AppConsts.aspect16on4,
          child: Container(
            decoration: AppConsts.decorationRadius8,
            child: Padding(
              padding: AppConsts.allPadding8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //logo pdf
                  HandleImageWidget(image: AppAssets.pdfLogo),
                  const Spacer(),
                  //pdf info
                  Expanded(
                    flex: 10,
                    child: MiddleCvWidget(pdf: pdf, portfolio: portfolio),
                  ),
                  const Spacer(),
                  //delete
                  IconButton(
                    onPressed: deleteMethod,
                    icon: Icon(
                      FontAwesomeIcons.circleXmark,
                      color: AppConsts.danger500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
