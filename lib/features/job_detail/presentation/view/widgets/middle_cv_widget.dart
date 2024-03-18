import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/models/user_profile_model/portfolio.dart';
import 'package:jobsque/features/job_detail/data/models/Pdf.dart';

class MiddleCvWidget extends StatelessWidget {
  const MiddleCvWidget({
    super.key,
    required this.pdf,
    required this.portfolio,
  });

  final Pdf? pdf;
  final PortfolioModel? portfolio;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          pdf == null ? buildNamePdf(portfolio!.cvFile!.path) : pdf!.name!,
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
    );
  }

  String buildNamePdf(String path) => path.split('/').toList().last;
}
