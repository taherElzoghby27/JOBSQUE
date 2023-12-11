import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/auth_top_section.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/core/widgets/or_sign_up_with_account_widget.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/core/widgets/text_form_field.dart';
import 'package:jobsque/features/auth/presentation/view/widgets/remeber_me_widget.dart';
import 'package:jobsque/features/auth/presentation/view/widgets/sign_with_google_and_facebook.dart';
import 'package:jobsque/features/auth/presentation/view_model/auth_bloc/auth_bloc.dart';

import '../../../../../core/consts/routesPage.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/widgets/customButton.dart';

enum AuthMode { SignUp, Login, ResetPassword }

class AuthBody extends StatefulWidget {
  const AuthBody({super.key});

  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.SignUp;
  String? name;
  String? email;
  String? password;

  bool visible = true;
  bool isLoading = false;

  ///switch auth mode
  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() => _authMode = AuthMode.SignUp);
    } else {
      setState(() => _authMode = AuthMode.Login);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Form(
            key: _formKey,
            child: FadeAnimation(
              millSeconds: 1000,
              child: ListView(
                children: [
                  ///top section
                  AuthTopSection(
                    title: _authMode == AuthMode.ResetPassword
                        ? StringsEn.resetPass
                        : _authMode == AuthMode.Login
                            ? StringsEn.login
                            : StringsEn.createAccount,
                    subTitle: _authMode == AuthMode.ResetPassword
                        ? StringsEn.enterEmailAddressYouUsed
                        : _authMode == AuthMode.Login
                            ? StringsEn.pleaseLoginToFindJop
                            : StringsEn.pleaseCreateAccount,
                    widget: Container(),
                  ),
                  //fields
                  SizedBox(
                    height: size.height * .45.h,
                    child: Column(
                      children: [
                        ///username
                        _authMode == AuthMode.ResetPassword
                            ? Container()
                            : _authMode == AuthMode.Login
                                ? Container()
                                : CustomTextFormField(
                                    perfixIcon: Image.asset(AppAssets.profile),
                                    hint: StringsEn.userName,
                                    onChanged: (String? value) => name = value,
                                  ),
                        SizedBox(height: size.height * .0175.h),

                        ///Email

                        CustomTextFormField(
                          perfixIcon: Image.asset(AppAssets.sms),
                          hint: StringsEn.email,
                          onChanged: (String? value) => email = value,
                        ),
                        SizedBox(height: size.height * .0175.h),

                        ///Password
                        _authMode == AuthMode.ResetPassword
                            ? Container()
                            : CustomTextFormField(
                                perfixIcon: Image.asset(AppAssets.lock),
                                hint: StringsEn.password,
                                obscureText: visible,
                                onChanged: (String? value) => password = value,
                              ),
                        _authMode == AuthMode.Login
                            ?

                            ///remeber me
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RemeberMeWidget(),
                                  SizedBox(width: size.width * .2.w),
                                  TextButton(
                                    onPressed: () => setState(
                                      () => _authMode = AuthMode.ResetPassword,
                                    ),
                                    child: Text(
                                      StringsEn.forgotPass,
                                      style: AppConsts.style14.copyWith(
                                        color: AppConsts.primary500,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                        SizedBox(height: size.height * .1.h),
                      ],
                    ),
                  ),
                  SizedBox.shrink(),

                  ///already have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _authMode == AuthMode.ResetPassword
                            ? StringsEn.youRemeberYourPassword
                            : _authMode == AuthMode.Login
                                ? StringsEn.dontHaveAccount
                                : StringsEn.alreadyHaveAccount,
                        style: AppConsts.style14,
                      ),
                      TextButton(
                        onPressed: () => _switchAuthMode(),
                        child: Text(
                          _authMode == AuthMode.Login &&
                                  _authMode != AuthMode.ResetPassword
                              ? StringsEn.register
                              : StringsEn.login,
                          style: AppConsts.style14.copyWith(
                            color: AppConsts.primary500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .01.h),

                  ///Create account or login or reset pass
                  SizedBox(
                    height: size.height * .055.h,
                    width: size.width * .9.w,
                    child: Visibility(
                      visible: !isLoading,
                      replacement: LoadingWidget(),
                      child: CustomButton(
                        text: _authMode == AuthMode.ResetPassword
                            ? StringsEn.requestPass
                            : _authMode == AuthMode.Login
                                ? StringsEn.login
                                : StringsEn.createAccount,
                        onTap: () {
                          ///create account
                          if (_formKey.currentState!.validate()) {
                            _authMode == AuthMode.SignUp ? register() : login();
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * .015.h),
                  _authMode == AuthMode.ResetPassword
                      ? Container()
                      : Column(
                          children: [
                            ///or sign up with account
                            OrSignUpOrSignInWithAccountWidget(
                              label: _authMode == AuthMode.Login
                                  ? StringsEn.orLoginWithAccount
                                  : StringsEn.orSignUp,
                            ),
                            SizedBox(height: size.height * .0175.h),
                            SignWithGoogleAndFaceBookWidget(size: size),
                          ],
                        ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is RegisterLoading || state is LoginLoading) {
          isLoading = true;
        } else if (state is RegisterLoaded || state is LoginLoaded) {
          isLoading = false;
          navigateToAnotherPage();
        } else if (state is RegisterFailure) {
          isLoading = false;
          showSnack(context, message: state.message);
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnack(context, message: state.message);
        }
      },
    );
  }

//login
  login() {
    BlocProvider.of<AuthBloc>(context).add(
      LoginEvent(email: email!, password: password!),
    );
  }

  //register
  register() {
    BlocProvider.of<AuthBloc>(context).add(
      RegisterEvent(
        name: name!,
        email: email!,
        password: password!,
      ),
    );
  }

  //navigate to another page
  navigateToAnotherPage() {
    GoRouter.of(context).pushReplacement(
      _authMode == AuthMode.ResetPassword
          ? successfullyPagePath
          : _authMode == AuthMode.Login
              ? homePath
              : interestedInWorkPath,
      extra: {
        StringsEn.icon: AppAssets.resetPassIcon,
        StringsEn.title: StringsEn.checkYourEmail,
        StringsEn.subTitle: StringsEn.weHaveSentAresetPassword,
        StringsEn.labelButton: StringsEn.openEmailApp,
        StringsEn.path: createPassPath,
      },
    );
  }
}
