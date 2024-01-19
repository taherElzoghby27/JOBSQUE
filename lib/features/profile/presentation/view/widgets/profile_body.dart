import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_general.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_others.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_profile_info.dart';
import 'package:jobsque/features/profile/presentation/view_model/signout_cubit/signout_cubit.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext contextParent) {
    return BlocConsumer<SignoutCubit, SignoutState>(
      builder: (context, state) {
        if (state is SignOutLoading) {
          return LoadingWidget();
        }
        return Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                //section profile
                SectionProfileInfo(ctx: contextParent),
                //section general
                SectionGeneral(),
                //section others
                SectionOthers(),
              ],
            ),
            Positioned(
              top: 50,
              width: 200,
              child: state is SignOutLoading
                  ? LoadingWidget(
                      height: 200,
                    )
                  : Container(),
            ),
          ],
        );
      },
      listener: (context, state) {
        if (state is SignOutFailure) {
          showSnack(context, message: StringsEn.someThingError);
        } else if (state is SignOutSucess) {
          showSnack(context, message: StringsEn.signOutSuccess);
        }
      },
    );
  }
}
