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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // keyboardType: hint == StringsEn.numberOfPieces.tr
      //     ? TextInputType.number
      //     : TextInputType.text,
      maxLines: maxLines,
      readOnly: readOnly,
      obscureText: obscureText,
      //style: AppConsts.stylePhoneNumber,
      cursorColor: AppConsts.primary500,
      controller: controller,
      validator: (value) {
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
        enabledBorder: AppConsts.normalBorderField,
        focusedBorder: AppConsts.focusedBorderField,
        errorBorder: AppConsts.errorBorderField,
        focusedErrorBorder: AppConsts.errorBorderField,
        disabledBorder: AppConsts.normalBorderField,
      ),
    );
  }
}
