import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/widgets/section_edit_photo.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/widgets/section_personal_info.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view_models/edit_profile_cubit/edit_profile_cubit.dart';

import '../../../../../../../../core/consts/routesPage.dart';
import '../../../../../../../../core/consts/strings.dart';
import '../../../../../../../../core/widgets/custom_app_bar.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({super.key});

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          //custom appBar
          CustomAppBar(
            leadingOnTap: () => GoRouter.of(context).pushReplacement(
              homePath,
              extra: 4,
            ),
            title: StringsEn.editProfile,
            trailingWidget: Container(),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //edit photo
          const SectionEditPhoto(),
          //edit personal info
          const SectionPersonalInfo(),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //save
          Center(
            child: AspectRatio(
              aspectRatio: AppConsts.aspectRatioButtonAuth,
              child: BlocConsumer<EditProfileCubit, EditProfileState>(
                builder: (context, state) {
                  return Visibility(
                    visible: !isLoad,
                    replacement: LoadingWidget(),
                    child: CustomButton(
                      text: StringsEn.save,
                      onTap: () async {
                        await BlocProvider.of<EditProfileCubit>(context).save();
                      },
                    ),
                  );
                },
                listener: (context, state) {
                  if (state is SavedLoading) {
                    isLoad = true;
                  } else if (state is SavedSuccess) {
                    isLoad = false;
                    GoRouter.of(context).pushReplacement(homePath);
                  } else if (state is SavedFailure) {
                    isLoad = false;
                    showSnack(
                      context,
                      message: StringsEn.someThingError,
                      background: AppConsts.danger500,
                    );
                  }
                },
              ),
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        ],
      ),
    );
  }
}
