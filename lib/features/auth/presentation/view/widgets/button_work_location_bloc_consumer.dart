import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/customButton.dart';

import '../../../../../core/consts/assets.dart';
import '../../../../../core/consts/routesPage.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/helper/custom_snack.dart';
import '../../../../../core/widgets/small_loading_widget.dart';
import '../../view_model/work_location_cubit/work_location_cubit.dart';

class ButtonWorkLocationBlocConsumer extends StatefulWidget {
  const ButtonWorkLocationBlocConsumer({super.key});

  @override
  State<ButtonWorkLocationBlocConsumer> createState() =>
      _ButtonWorkLocationBlocConsumerState();
}

class _ButtonWorkLocationBlocConsumerState
    extends State<ButtonWorkLocationBlocConsumer> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkLocationCubit, WorkLocationState>(
      listener: (context, state) {
        if (state is InterestedInWorkLoading) {
          loading = true;
        } else if (state is InterestedInWorkSuccess) {
          loading = false;
          GoRouter.of(context).pushReplacement(
            successfullyPagePath,
            extra: {
              StringsEn.icon: AppAssets.user,
              StringsEn.title: StringsEn.yourAccountHasBeenSetUp,
              StringsEn.subTitle: StringsEn.weHaveCustomizedFeeds,
              StringsEn.labelButton: StringsEn.getStarted,
              StringsEn.path: homePath,
            },
          );
        } else if (state is InterestedInWorkFailure) {
          showSnack(
            context,
            message: StringsEn.whereAreYouLocationError,
            background: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        return Visibility(
          visible: !loading,
          replacement: const LoadingWidget(),
          child: CustomButton(
            text: StringsEn.next,
            onTap: () async {
              await BlocProvider.of<WorkLocationCubit>(context)
                  .handleNextAction();
            },
          ),
        );
      },
    );
  }
}
