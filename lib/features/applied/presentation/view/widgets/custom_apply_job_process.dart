import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .125.h,
      decoration: AppConsts.decorationRadius8,
      child: Center(
        child: FittedBox(
          child: CirclesBarSection(currentPage: currentStatus),
        ),
      ),
    );
  }
}
