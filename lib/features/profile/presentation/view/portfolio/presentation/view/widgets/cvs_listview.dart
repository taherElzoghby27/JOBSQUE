
import 'package:flutter/material.dart';
import 'package:jobsque/core/models/user_profile_model/portfolio.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/cv_widget.dart';

class CvsListView extends StatelessWidget {
  const CvsListView({
    super.key,
    required this.cvs,
  });

  final List<PortfolioModel> cvs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => CvWidget(
        name: cvs[index].cvFile!,
      ),
      itemCount: cvs.length,
    );
  }
}
