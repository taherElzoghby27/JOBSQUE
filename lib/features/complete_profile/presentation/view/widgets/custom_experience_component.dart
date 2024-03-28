import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/complete_profile/presentation/view_models/add_experience_cubit/add_experience_cubit.dart';

import '../../../../../core/consts/style.dart';
import 'experience_component_bloc_builder.dart';

class CustomExperienceComponent extends StatefulWidget {
  const CustomExperienceComponent({super.key});

  @override
  State<CustomExperienceComponent> createState() =>
      _CustomExperienceComponentState();
}

class _CustomExperienceComponentState extends State<CustomExperienceComponent> {
  late AddExperienceCubit bloc;

  @override
  initState() {
    bloc = BlocProvider.of<AddExperienceCubit>(context);
    bloc.typeOfWork = bloc.dropDownButtonsLabel[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppConsts.decorationRadius8,
      child: Padding(
        padding: AppConsts.allPadding8,
        child: ExperienceComponentBlocBuilder(),
      ),
    );
  }
}
