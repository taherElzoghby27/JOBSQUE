import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/complete_profile/presentation/view_models/add_experience_cubit/add_experience_cubit.dart';

class ExperienceButtonBlocConsumer extends StatefulWidget {
  const ExperienceButtonBlocConsumer({super.key});

  @override
  State<ExperienceButtonBlocConsumer> createState() =>
      _ExperienceButtonBlocConsumerState();
}

class _ExperienceButtonBlocConsumerState
    extends State<ExperienceButtonBlocConsumer> {
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddExperienceCubit, AddExperienceState>(
      listener: (context, state) {
        if (state is AddedLoading) {
          isLoad = true;
        } else if (state is AddedSuccess) {
          isLoad = false;
          GoRouter.of(context).pop();
        } else if (state is AddedFailure) {
          isLoad = false;
          showSnack(
            context,
            message: state.message,
            background: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        return Center(
          child: AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth,
            child: Visibility(
              visible: !isLoad,
              replacement: LoadingWidget(),
              child: CustomButton(
                text: StringsEn.save,
                onTap: () async {
                  await BlocProvider.of<AddExperienceCubit>(context)
                      .addExperience();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
