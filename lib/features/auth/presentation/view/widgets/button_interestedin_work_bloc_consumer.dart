import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/auth/presentation/view_model/interested_in_work_cubit/interested_in_work_cubit.dart';

class ButtonInterestedInWorkBlocConsumer extends StatefulWidget {
  const ButtonInterestedInWorkBlocConsumer({super.key});

  @override
  State<ButtonInterestedInWorkBlocConsumer> createState() =>
      _ButtonInterestedInWorkBlocConsumerState();
}

class _ButtonInterestedInWorkBlocConsumerState
    extends State<ButtonInterestedInWorkBlocConsumer> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InterestedInWorkCubit, InterestedInWorkState>(
      listener: (context, state) {
        if (state is Success) {
          isLoading = false;
          GoRouter.of(context).pushReplacement(locationWorkPath);
        } else if (state is Loading) {
          isLoading = true;
        } else if (state is Failure) {
          isLoading = false;
          showSnack(
            context,
            message: StringsEn.whatTypeError,
            background: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        return AspectRatio(
          aspectRatio: AppConsts.aspectRatioButtonAuth,
          child: Visibility(
            visible: !isLoading,
            replacement: const LoadingWidget(),
            child: CustomButton(
              text: StringsEn.next,
              onTap: () async {
                await BlocProvider.of<InterestedInWorkCubit>(context)
                    .handleNextAction();
              },
            ),
          ),
        );
      },
    );
  }
}
