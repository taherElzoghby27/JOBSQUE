import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_about_edit.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_info.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_info_jobs.dart';
import 'package:jobsque/features/profile/presentation/view_model/signout_cubit/signout_cubit.dart';

import '../../../../../core/consts/style.dart';

class SectionProfileInfo extends StatelessWidget {
  const SectionProfileInfo({super.key, required this.ctx});
  final BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * .35.h,
          child: Stack(
            children: [
              //app bar
              //background
              Container(
                height: size.height * .2.h,
                color: AppConsts.primary100,
                child: Column(
                  children: [
                    SizedBox(height: size.height * .02.h),

                    //appBar
                    CustomAppBar(
                      leadingOnTap: () =>
                          GoRouter.of(context).pushReplacement(homePath),
                      title: StringsEn.profile,
                      trailingWidget: IconButton(
                        onPressed: () async {
                          await BlocProvider.of<SignoutCubit>(context).signOut()
                              ? GoRouter.of(ctx).pushReplacement(splashPath)
                              : () {};
                        },
                        icon: Icon(Icons.logout, color: AppConsts.danger500),
                      ),
                    ),
                  ],
                ),
              ),

              //info
              Positioned(
                top: size.height * .135.h,
                width: size.width,
                child: Info(
                  image: AppAssets.board3,
                  name: 'Taher Amin Elzoghby',
                  titleJob: 'Senior Software Engineer',
                ),
              ),
            ],
          ),
        ),
        //info about job(applied-reviewed-contacted)
        SectionInfoJobs(),
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
