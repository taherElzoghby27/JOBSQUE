import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/profile/presentation/view/notification/presentation/view/widgets/custom_tile_switch.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view_models/two_step_verifi/two_step_verification_cubit.dart';

class CustomTileSwitchWidget extends StatelessWidget {
  const CustomTileSwitchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspect16on4,
      child: Container(
        decoration: AppConsts.decorationRadius8,
        child: BlocBuilder<TwoStepVerificationCubit, TwoStepVerificationState>(
          builder: (context, state) {
            final bloc = BlocProvider.of<TwoStepVerificationCubit>(context);
            bool status = false;
            if (state is ChangedSwitch) {
              status = state.status;
            }
            return CustomTileSwitch(
              label: StringsEn.secureYourAccount,
              value: status,
              styleText: AppConsts.style16.copyWith(
                fontWeight: FontWeight.w500,
              ),
              onChanged: (bool value) => bloc.changeSwitchTile(value),
            );
          },
        ),
      ),
    );
  }
}
