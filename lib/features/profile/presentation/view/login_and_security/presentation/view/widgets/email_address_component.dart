import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_filter_text_field.dart';
import 'package:jobsque/core/widgets/custom_filter_text_form_field.dart';
import 'package:jobsque/core/widgets/text_form_field.dart';
import 'package:jobsque/core/widgets/title_field.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view_models/update_name_password_cubit/update_name_pass_cubit.dart';

class EmailAddressPage extends StatelessWidget {
  const EmailAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    UpdateNamePassCubit bloc = BlocProvider.of<UpdateNamePassCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: bloc.keyForm,
        child: Column(
          children: [
            SizedBox(height: size.height * .01.h),
            //jop title
            TitleField(label: StringsEn.mainEmailAddress),
            SizedBox(height: size.height * .01.h),
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
      ),
    );
  }
}
