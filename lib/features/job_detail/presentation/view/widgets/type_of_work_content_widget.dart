import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/item_cv_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/type_of_work_cubit/type_of_work_cubit.dart';

class TypeOfWorkContentWidget extends StatelessWidget {
  const TypeOfWorkContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TypeOfWorkCubit, TypeOfWorkState>(
      builder: (context, state) {
        TypeOfWorkCubit bloc = context.read<TypeOfWorkCubit>();
        List<String> typeOfWorks = bloc.typeOfWorks;
        String group = bloc.group;
        if (state is ChangedRadioButtonTypeOfWorkState) {
          group = state.typeOfWork;
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ItemCvWidget(
            item: typeOfWorks[index],
            group: group,
            onChanged: (String? value) => bloc.changeTypeOfWork(value: value!),
          ),
          itemCount: typeOfWorks.length,
        );
      },
    );
  }
}
