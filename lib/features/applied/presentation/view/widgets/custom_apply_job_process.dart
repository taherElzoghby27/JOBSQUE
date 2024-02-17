import 'package:flutter/cupertino.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/circles_bar_section.dart';

class CustomApplyJobProcess extends StatelessWidget {
  const CustomApplyJobProcess({
    super.key,
    required this.currentStatus,
  });

  final int currentStatus;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspect16on5,
      child: Container(
        decoration: AppConsts.decorationRadius8,
        child: Center(
          child: FittedBox(
            child: CirclesBarSection(currentPage: currentStatus),
          ),
        ),
      ),
    );
  }
}
