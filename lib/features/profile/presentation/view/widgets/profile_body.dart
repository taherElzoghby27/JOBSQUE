import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/models/user_profile_model/user_profile_portolio_model.dart';
import 'package:jobsque/core/widgets/load_json_widget.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_general.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_others.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_profile_info.dart';
import 'package:jobsque/features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext contextParent) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetProfileLoading) {
          return Center(child: LoadJsonWidget());
        } else if (state is GetProfileSuccess) {
          UserProfilePortfolioModel profile = state.userProfileModel;
          print("sucess");
          return Stack(
            children: [
              ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  //section profile
                  SectionProfileInfo(
                    ctx: contextParent,
                    name: profile.profile!.name,
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
        return Center(child: LoadJsonWidget());
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
