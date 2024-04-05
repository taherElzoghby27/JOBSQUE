// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_about_edit.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_info.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_info_jobs.dart';
import 'package:jobsque/features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';

import '../../../../../core/consts/style.dart';
import '../../../../../core/helper/dialog_help.dart';

class SectionProfileInfo extends StatelessWidget {
  const SectionProfileInfo({
    Key? key,
    required this.ctx,
    required this.name,
    required this.bio,
  }) : super(key: key);
  final BuildContext ctx;
  final String name;
  final String bio;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    trailingOnTap() async {
      customDialog(
        title: StringsEn.warningSignOut,
        context: ctx,
        onTapSuccess: () async {
          await BlocProvider.of<ProfileCubit>(context).signOut()
              ? GoRouter.of(ctx).pushReplacement(splashPath)
              : () {};
        },
        onTapCancel: () => GoRouter.of(context).pop(),
      );
    }

    return Column(
      children: [
        AspectRatio(
          aspectRatio: AppConsts.aspect13on10,
          child: Stack(
            children: [
              //background
              AspectRatio(
                aspectRatio: AppConsts.aspect16on8,
                child: Container(color: AppConsts.primary100),
              ),

              //info
              Positioned(
                width: size.width,
                child: Column(
                  children: [
                    const AspectRatio(aspectRatio: AppConsts.aspect16on1),

                    //appBar
                    CustomAppBar(
                      leadingOnTap: () => GoRouter.of(context).pushReplacement(
                        homePath,
                        extra: 0,
                      ),
                      title: StringsEn.profile,
                      trailingWidget: IconButton(
                        onPressed: trailingOnTap,
                        icon: Icon(
                          Icons.logout,
                          color: AppConsts.danger500,
                        ),
                      ),
                    ),
                    const AspectRatio(aspectRatio: AppConsts.aspect16on2),
                    Info(
                      image: AppAssets.board3,
                      name: name,
                      titleJob: bio,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //info about job(applied-reviewed-contacted)
        const SectionInfoJobs(),
        //about
        SectionAboutEdit(
          leading: StringsEn.about,
          trailing: StringsEn.edit,
          onTapTrail: () {},
          about: StringsEn.aboutInfo,
        ),
      ],
    );
  }
}
