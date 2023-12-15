import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/text_field.dart';
import 'package:jobsque/core/widgets/text_form_field.dart';
import 'package:jobsque/core/widgets/title_field.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/apply_job_bloc/apply_job_bloc.dart';

class CustomFilterTextFormField extends StatelessWidget {
  const CustomFilterTextFormField({
    super.key,
    this.hint,
    this.perfixIcon,
    this.label,
    this.suffixIcon,
    this.readOnly = false,
    this.star,
    this.onChanged,
    this.obscureText = false,
    this.border,
    this.controller,
  });

  final String? label;
  final String? hint;
  final Widget? perfixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final String? star;
  final void Function(String?)? onChanged;
  final bool obscureText;
  final OutlineInputBorder? border;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ApplyJobBloc bloc = BlocProvider.of<ApplyJobBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //jop title
        TitleField(label: label, star: star),
        SizedBox(height: size.height * .01.h),
        //field
        CustomTextFormField(
          hint: hint ?? '',
          perfixIcon: perfixIcon,
          suffixIcon: suffixIcon,
          readOnly: readOnly,
          onChanged: onChanged,
          obscureText: obscureText,
          border: border,
          controller: controller,
          validator: (value) {
            if (value!.isNotEmpty) {
              if (hint == StringsEn.email || hint == StringsEn.phone) {
                if ((hint == StringsEn.email &&
                        (!value.contains("@") || !value.contains('.com'))) ||
                    (hint == StringsEn.phone &&
                        (!bloc.checkPhoneNumber() || value.length < 9))) {
                  return '${StringsEn.enterValid}$hint';
                }
              }
            }

            if (value.isEmpty) {
              return StringsEn.fieldRequired;
            }
            if (hint == StringsEn.password) {
              if (value.length < 7) {
                return StringsEn.warningPass;
              }
            }
            return null;
          },
        ),
      ],
    );
  }
}
