import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/widgets/text_field.dart';
import 'package:jobsque/core/widgets/title_field.dart';

class CustomFilterTextField extends StatelessWidget {
  const CustomFilterTextField({
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
  final void Function(String)? onChanged;
  final bool obscureText;
  final OutlineInputBorder? border;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///jop title
        TitleField(label: label, star: star),
        SizedBox(height: size.height * .01.h),
        //field
        CustomTextField(
          hint: hint ?? '',
          perfixIcon: perfixIcon,
          suffixIcon: suffixIcon,
          readOnly: readOnly,
          onChanged: onChanged,
          obscureText: obscureText,
          border: border,
          controller: controller,
        ),
      ],
    );
  }
}
