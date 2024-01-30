import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/profile/presentation/view/notification/presentation/view/widgets/custom_tile_switch.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view_models/two_step_verifi/two_step_verification_cubit.dart';

class custom_tile_switch_widget extends StatelessWidget {
  const custom_tile_switch_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .1.h,
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
    );
  }
}
