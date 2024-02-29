import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/consts/enums.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/helper/custom_snack.dart';
import '../../../../../core/widgets/customButton.dart';
import '../../../../../core/widgets/small_loading_widget.dart';
import '../../view_model/auth_bloc/auth_bloc.dart';

class AuthButtonBlocConsumer extends StatefulWidget {
  const AuthButtonBlocConsumer({
    super.key,
    required this.tapAuth,
    required this.authMode,
    required this.successAction,
  });

  final dynamic Function() tapAuth;
  final AuthMode authMode;
  final void Function() successAction;

  @override
  State<AuthButtonBlocConsumer> createState() => _AuthButtonBlocConsumerState();
}

class _AuthButtonBlocConsumerState extends State<AuthButtonBlocConsumer> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading || state is LoginLoading) {
          isLoading = true;
        } else if (state is RegisterLoaded || state is LoginLoaded) {
          isLoading = false;
          widget.successAction();
        } else if (state is RegisterFailure) {
          isLoading = false;
          showSnack(
            context,
            message: state.message,
            background: AppConsts.danger500,
          );
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnack(
            context,
            message: state.message,
            background: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        return AspectRatio(
          aspectRatio: AppConsts.aspectRatioButtonAuth.sp,
          child: Visibility(
            visible: !isLoading,
            replacement: const LoadingWidget(),
            child: CustomButton(
              text: widget.authMode == AuthMode.ResetPassword
                  ? StringsEn.requestPass
                  : widget.authMode == AuthMode.Login
                      ? StringsEn.login
                      : StringsEn.createAccount,
              onTap: widget.tapAuth,
            ),
          ),
        );
      },
    );
  }
}
