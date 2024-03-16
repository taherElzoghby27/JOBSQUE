import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/complete_profile/presentation/view_models/add_education_cubit/add_education_cubit.dart';

class SectionButtonEducation extends StatefulWidget {
  const SectionButtonEducation({super.key});

  @override
  State<SectionButtonEducation> createState() => _SectionButtonEducationState();
}

class _SectionButtonEducationState extends State<SectionButtonEducation> {
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: AppConsts.aspectRatioButtonAuth,
        child: BlocConsumer<AddEducationCubit, AddEducationState>(
          builder: (context, state) {
            return Visibility(
              visible: !isLoad,
              replacement: const LoadingWidget(),
              child: CustomButton(
                text: StringsEn.save,
                onTap: () => BlocProvider.of<AddEducationCubit>(context).save(),
              ),
            );
          },
          listener: (context, state) {
            if (state is AddedSuccessfullyState) {
              isLoad = false;
              GoRouter.of(context).pop();
            } else if (state is AddedLoadingState) {
              isLoad = true;
            } else if (state is AddedFailureState) {
              isLoad = false;
              showSnack(
                context,
                message: state.message,
                background: AppConsts.danger500,
              );
            }
          },
        ),
      ),
    );
  }
}
