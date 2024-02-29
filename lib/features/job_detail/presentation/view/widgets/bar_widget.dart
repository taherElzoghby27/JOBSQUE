import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/bar_component.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/job_details_cubit/job_details_cubit.dart';

import '../../../../../../core/consts/style.dart';

class BarWidgetJobDetail extends StatelessWidget {
  const BarWidgetJobDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobDetailsCubit, JobDetailsState>(
      builder: (context, state) {
        JobDetailsCubit bloc = BlocProvider.of<JobDetailsCubit>(context);
        int current = bloc.current;
        return Padding(
          padding: AppConsts.mainPadding,
          child: AspectRatio(
            aspectRatio: AppConsts.aspect16on2,
            child: Container(
              decoration: AppConsts.barDecoration,
              child: Row(
                children: List.generate(
                  3,
                  (int index) => Expanded(
                    child: BarComponent(
                      title: StringsEn.desicription,
                      color: current == index
                          ? AppConsts.primary900
                          : AppConsts.neutral200,
                      onTap: () => bloc.change(index: index),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
