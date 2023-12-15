// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hint,
    this.onSaved,
    this.onChanged,
    this.obscureText = false,
    this.perfixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.maxLines = 1,
    this.perfixText = '',
    this.controller,
    this.border,
  }) : super(key: key);
  final String hint;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final bool obscureText;
  final Widget? perfixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final int maxLines;
  final String perfixText;
  final TextEditingController? controller;
  final OutlineInputBorder? border;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: hint == StringsEn.noHandPhone
          ? TextInputType.number
          : TextInputType.text,
      maxLines: maxLines,
      readOnly: readOnly,
      obscureText: obscureText,
      cursorColor: AppConsts.primary500,
      controller: controller,
      validator: (value) {
        if (hint == StringsEn.fullTime ||
            hint == StringsEn.email ||
            hint == StringsEn.noHandPhone) {
          if (value!.isEmpty) {
            return StringsEn.fieldRequired;
          }
          if ((hint == StringsEn.email && !value.contains("@")) ||
              (hint == StringsEn.noHandPhone && value.length < 9)) {
            return '${StringsEn.enterValid}$hint';
          }
        }
        if (value!.isEmpty) {
          return '${StringsEn.enterValid}$hint';
        }
        if (hint == StringsEn.password) {
          if (value.length < 7) {
            return StringsEn.warningPass;
          }
        }

        return null;
      },
      onFieldSubmitted: onSaved,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppConsts.styleHint14,
        prefixIcon: perfixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: border ??
            AppConsts.normalBorderField.copyWith(
              borderRadius: BorderRadius.circular(8),
            ),
        focusedBorder: border ??
            AppConsts.normalBorderField.copyWith(
              borderRadius: BorderRadius.circular(8),
            ),
        focusedErrorBorder: border ??
            AppConsts.normalBorderField.copyWith(
              borderRadius: BorderRadius.circular(8),
            ),
      ),
    );
  }
}
