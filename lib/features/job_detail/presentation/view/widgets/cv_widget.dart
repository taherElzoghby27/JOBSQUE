import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/job_detail/data/models/Pdf.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view_models/portfolio_cubit/portfolio_cubit.dart';

import '../../../../../core/models/user_profile_model/portfolio.dart';

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
    Size size = MediaQuery.of(context).size;
    return Padding(
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
                SvgPicture.asset(AppAssets.pdfLogo),
                const Spacer(flex: 1),
                //pdf info
                SizedBox(
                  width: size.width * .5.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        pdf == null ? portfolio!.cvFile! : pdf!.name!,
                        style: AppConsts.style14.copyWith(
                          color: AppConsts.neutral900,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${StringsEn.cvpdf} ${pdf == null ? '' : pdf!.size} ${pdf == null ? '' : StringsEn.mb}',
                        style: AppConsts.style12.copyWith(
                          color: AppConsts.neutral500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 7),
                //delete
                IconButton(
                  onPressed: () async {
                    final bloc = BlocProvider.of<PortfolioCubit>(context);
                    await bloc.deletePortfolio(
                      idPortfolio: portfolio!.id!,
                    );
                    await bloc.getPortfolios();
                  },
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
    );
  }
}
