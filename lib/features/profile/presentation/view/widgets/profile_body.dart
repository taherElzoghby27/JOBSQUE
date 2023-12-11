import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_general.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_others.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_profile_info.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        //section profile
        SectionProfileInfo(),
        //section general
        SectionGeneral(),
        //section others
        SectionOthers(),
      ],
    );
  }
}
