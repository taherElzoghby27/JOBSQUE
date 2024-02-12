import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/error_widget.dart';
import 'package:jobsque/core/widgets/load_json_widget.dart';
import 'package:jobsque/features/auth/data/models/user_login/user.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_general.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_others.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_profile_info.dart';
import 'package:jobsque/features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext contextParent) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetProfileLoading) {
          return Center(child: LoadJsonWidget());
        } else if (state is GetProfileSuccess) {
          User user = state.userProfileModel;
          return Stack(
            children: [
              ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  //section profile
                  SectionProfileInfo(
                    ctx: contextParent,
                    name: user.name!,
                    bio: StringsEn.softwareEngineer,
                  ),
                  //section general
                  SectionGeneral(),
                  //section others
                  SectionOthers(),
                ],
              ),
              Positioned(
                child: state is SignOutLoading
                    ? Center(child: LoadJsonWidget())
                    : Container(),
              ),
            ],
          );
        }
        return ErrorWidg(message: 'message');
      },
      listener: (context, state) {
        if (state is SignOutFailure || state is GetProfileFailure) {
          showSnack(context, message: StringsEn.someThingError);
        } else if (state is SignOutSucess) {
          showSnack(context, message: StringsEn.signOutSuccess);
        }
      },
    );
  }
}
