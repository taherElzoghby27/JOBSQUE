import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/bar_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/people_content_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/job_details_cubit/job_details_cubit.dart';

import 'Company_content_widget.dart';
import 'description_content_widget.dart';

class DescriptionCompanyPeopleSectionJopDetail extends StatelessWidget {
  const DescriptionCompanyPeopleSectionJopDetail({
    super.key,
    required this.job,
  });

  final Job job;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<JobDetailsCubit, JobDetailsState>(
      builder: (context, state) {
        JobDetailsCubit bloc = BlocProvider.of<JobDetailsCubit>(context);
        int current = bloc.current;
        return ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Center(child: const BarWidgetJobDetail()),
            current == 0
                ? ContentDescriptionWidget(job: job)
                : current == 1
                    ? CompanyContentWidget(job: job)
                    : PeopleContentWidget(job: job),
            SizedBox(height: size.height * .12.h),
          ],
        );
      },
    );
  }
}
