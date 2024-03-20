import 'package:flutter/material.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_others.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/models/user_profile_model/user_profile_portolio_model.dart';
import 'section_general.dart';
import 'section_profile_info.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    required this.user,
    required this.ctx,
    required this.isSignOutStateLoading,
  });

  final UserProfilePortfolioModel user;
  final BuildContext ctx;
  final bool isSignOutStateLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            //section profile
            SectionProfileInfo(
              ctx: ctx,
              name: CacheHelper.getData(key: StringsEn.name),
              bio: user.profile!.bio!,
            ),
            //section general
            const SectionGeneral(),
            //section others
            const SectionOthers(),
          ],
        ),
        Positioned(
          child: isSignOutStateLoading
              ? Center(child: const LoadingWidget())
              : Container(),
        ),
      ],
    );
  }
}
