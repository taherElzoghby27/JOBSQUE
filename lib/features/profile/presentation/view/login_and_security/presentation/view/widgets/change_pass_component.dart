import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_filter_text_field.dart';
import 'package:jobsque/core/widgets/title_field.dart';

import '../../../../../../../../core/widgets/text_form_field.dart';
import '../../view_models/update_name_password_cubit/update_name_pass_cubit.dart';

class ChangePassComponent extends StatelessWidget {
  const ChangePassComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    UpdateNamePassCubit bloc = BlocProvider.of<UpdateNamePassCubit>(context);
    return Form(
      key: bloc.keyForm,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(height: size.height * .01.h),
            //enter your name
            TitleField(label: StringsEn.enterYourName),
            SizedBox(height: size.height * .01.h),
            //name
            CustomTextFormField(
              hint: StringsEn.enterYourName,
              perfixIcon: Icon(Icons.mail, size: 16.sp),
              onChanged: (String? value) => bloc.changeData(
                value: value!,
                status: StringsEn.name,
              ),
            ),
            SizedBox(height: size.height * .01.h),
            //enter your password
            TitleField(label: StringsEn.enterYourPass),
            SizedBox(height: size.height * .01.h),
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
      ),
    );
  }
}
