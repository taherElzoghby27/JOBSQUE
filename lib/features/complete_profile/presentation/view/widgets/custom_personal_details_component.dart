import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/widgets/section_edit_photo.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/widgets/section_personal_info.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view_models/edit_profile_cubit/edit_profile_cubit.dart';

import '../../../../../core/helper/custom_snack.dart';
import '../../../../../core/widgets/customButton.dart';
import '../../../../../core/widgets/small_loading_widget.dart';

class CustomPersonalDetailsComponent extends StatefulWidget {
  const CustomPersonalDetailsComponent({super.key});

  @override
  State<CustomPersonalDetailsComponent> createState() =>
      _CustomPersonalDetailsComponentState();
}

class _CustomPersonalDetailsComponentState
    extends State<CustomPersonalDetailsComponent> {
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //edit photo
        const SectionEditPhoto(),
        //edit personal info
        const SectionPersonalInfo(),
        const AspectRatio(aspectRatio: AppConsts.aspect16on2),
        //save
        //save
        Center(
          child: AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth,
            child: BlocConsumer<EditProfileCubit, EditProfileState>(
              builder: (context, state) {
                return Visibility(
                  visible: !isLoad,
                  replacement: const LoadingWidget(),
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
                  GoRouter.of(context).pushReplacement(
                    homePath,
                    extra: 0,
                  );
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
    );
  }
}
