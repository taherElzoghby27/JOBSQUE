import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/text_form_field.dart';
import 'package:jobsque/core/widgets/title_field.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view_models/update_name_password_cubit/update_name_pass_cubit.dart';

class EmailAddressPage extends StatelessWidget {
  const EmailAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateNamePassCubit bloc = BlocProvider.of<UpdateNamePassCubit>(context);
    return Form(
      key: bloc.keyForm,
      child: Column(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //jop title
          TitleField(label: StringsEn.mainEmailAddress),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //email
          CustomTextFormField(
            hint: StringsEn.email,
            perfixIcon: Icon(Icons.mail, size: 16.sp),
            onChanged: (String? value) => bloc.changeData(
              value: value!,
              status: StringsEn.email,
            ),
          ),
        ],
      ),
    );
  }
}
