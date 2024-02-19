import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/title_field.dart';

import '../../../../../../../../core/widgets/text_form_field.dart';
import '../../view_models/update_name_password_cubit/update_name_pass_cubit.dart';

class ChangePassComponent extends StatelessWidget {
  const ChangePassComponent({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateNamePassCubit bloc = BlocProvider.of<UpdateNamePassCubit>(context);
    return Form(
      key: bloc.keyForm,
      child: Column(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //enter your name
          TitleField(label: StringsEn.enterYourName),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //name
          CustomTextFormField(
            hint: StringsEn.enterYourName,
            perfixIcon: Icon(Icons.mail, size: 16.sp),
            onChanged: (String? value) => bloc.changeData(
              value: value!,
              status: StringsEn.name,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //enter your password
          TitleField(label: StringsEn.enterYourPass),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //password
          CustomTextFormField(
            hint: StringsEn.enterYourPass,
            obscureText: true,
            perfixIcon: Icon(Icons.mail, size: 16.sp),
            onChanged: (String? value) => bloc.changeData(
              value: value!,
              status: StringsEn.password,
            ),
          ),
        ],
      ),
    );
  }
}
