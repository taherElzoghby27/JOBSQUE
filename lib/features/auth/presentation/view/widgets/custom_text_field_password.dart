import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/handle_image.dart';
import 'package:jobsque/core/widgets/text_form_field.dart';

class CustomTextFieldPassword extends StatefulWidget {
  const CustomTextFieldPassword({
    super.key,
    this.onChanged,
  });

  final void Function(String?)? onChanged;

  @override
  State<CustomTextFieldPassword> createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      perfixIcon: HandleImageWidget(
        image: AppAssets.lock,
      ),
      suffixIcon: IconButton(
        onPressed: () => setState(() => visible = !visible),
        icon: Icon(visible ? Icons.visibility_off : Icons.visibility),
      ),
      hint: StringsEn.password,
      obscureText: visible,
      onChanged: widget.onChanged,
    );
  }
}
