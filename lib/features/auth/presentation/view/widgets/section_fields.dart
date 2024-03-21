import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/enums.dart';
import 'package:jobsque/features/auth/presentation/view_model/auth_bloc/auth_bloc.dart';

import 'fields_auth.dart';

class SectionFields extends StatelessWidget {
  const SectionFields({
    super.key,
    required this.onTapForgetPass,
    required this.authMode,
    required this.bloc,
  });

  final AuthMode authMode;
  final void Function() onTapForgetPass;
  final AuthBloc bloc;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: bloc.controller,
      builder: (context, child) {
        return AnimatedSlide(
          offset: bloc.offsetAnimation.value,
          duration: const Duration(milliseconds: 200),
          child: FieldsAuth(
            authMode: authMode,
            userNameChange: (String? value) => bloc.name = value,
            emailChange: (String? value) => bloc.email = value,
            passwordChange: (String? value) => bloc.password = value,
            onTapForgetPassword: onTapForgetPass,
          ),
        );
      },
    );
  }
}
