
import 'package:flutter/material.dart';
import 'package:jobsque/core/widgets/load_json_widget.dart';
import 'package:jobsque/features/auth/data/models/user_login/user.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_others.dart';

import '../../../../../core/consts/strings.dart';
import 'section_general.dart';
import 'section_profile_info.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    required this.user,
    required this.ctx,
    required this.isSignOutStateLoading,
  });

  final User user;
  final BuildContext ctx;
  final bool isSignOutStateLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            //section profile
            SectionProfileInfo(
              ctx: ctx,
              name: user.name!,
              bio: StringsEn.softwareEngineer,
            ),
            //section general
            const SectionGeneral(),
            //section others
            const SectionOthers(),
          ],
        ),
        Positioned(
          child: isSignOutStateLoading
              ? Center(child: const LoadJsonWidget())
              : Container(),
        ),
      ],
    );
  }
}
