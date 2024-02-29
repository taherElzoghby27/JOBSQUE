import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/bar_component.dart';
import '../../view_models/applied_job_cubit/applied_job_cubit.dart';

import '../../../../../../core/consts/style.dart';

class CustomBarAppliedJob extends StatefulWidget {
  const CustomBarAppliedJob({super.key});

  @override
  State<CustomBarAppliedJob> createState() => _CustomBarAppliedJobState();
}

class _CustomBarAppliedJobState extends State<CustomBarAppliedJob> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AppliedJobCubit>(context);
    return Padding(
      padding: AppConsts.mainPadding,
      child: AspectRatio(
        aspectRatio: AppConsts.aspect16on2,
        child: Container(
          decoration: AppConsts.barDecoration,
          child: Row(
            children: List.generate(
              3,
              (index) => Expanded(
                child: BarComponent(
                  title: StringsEn.active,
                  color: currentPage == index
                      ? AppConsts.primary900
                      : AppConsts.neutral200,
                  onTap: () {
                    setState(() => currentPage = index);
                    bloc.getAppliedJobs();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
