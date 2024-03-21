import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/auth_top_section.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/features/auth/presentation/view_model/auth_bloc/auth_bloc.dart';
import '../../../../../core/consts/animation_helper.dart';
import '../../../../../core/consts/enums.dart';
import '../../../../../core/consts/routesPage.dart';
import '../../../../../core/consts/style.dart';
import 'alternative_auth.dart';
import 'auth_button_bloc_consumer.dart';
import 'auth_with_social.dart';
import 'fields_auth.dart';
import 'section_bottom_auth.dart';
import 'section_fields.dart';

class AuthBody extends StatefulWidget {
  const AuthBody({super.key});

  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> with TickerProviderStateMixin {
  late AuthBloc bloc;
  AuthMode _authMode = AuthMode.SignUp;

  @override
  void initState() {
    bloc = BlocProvider.of<AuthBloc>(context);
    _handleAnimation();
    super.initState();
  }

  void _handleAnimation() {
    _initController();
    bloc.offsetAnimation = tweenSequence().animate(bloc.controller);
  }

  void _initController() {
    bloc.controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  ///switch auth mode
  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() => _authMode = AuthMode.SignUp);
    } else {
      setState(() => _authMode = AuthMode.Login);
    }
  }

  @override
  void dispose() {
    bloc.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Form(
        key: bloc.formKey,
        child: FadeAnimation(
          millSeconds: 1000,
          child: Stack(
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

              ///fields
              Positioned(
                left: 0,
                right: 0,
                top: MediaQuery.sizeOf(context).height * .25,
                child: SectionFields(
                  onTapForgetPass: () => setState(
                    () => _authMode = AuthMode.ResetPassword,
                  ),
                  authMode: _authMode,
                  bloc: bloc,
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                top: MediaQuery.sizeOf(context).height * .7,
                child: SectionBottomAuth(
                  authMode: _authMode,
                  actionSignInOrSignUp: () => _switchAuthMode(),
                  buttonAuth: buttonAuth,
                  successAction: navigateToAnotherPage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buttonAuth() {
    if (bloc.formKey.currentState!.validate()) {
      successValidate();
    } else {
      failValidate();
    }
    Future.delayed(
      const Duration(milliseconds: 500),
      () => stopAndResetAnimation(),
    );
  }

  failValidate() {
    startAnimation();
  }

  startAnimation() {
    if (!bloc.controller.isAnimating) {
      bloc.controller
        ..forward()
        ..repeat();
    }
  }

  successValidate() {
    _authMode == AuthMode.ResetPassword
        ? requestPass()
        : _authMode == AuthMode.SignUp
            ? register()
            : login();
    stopAnimation();
  }

  stopAnimation() {
    if (bloc.controller.isAnimating) {
      stopAndResetAnimation();
    }
  }

  stopAndResetAnimation() {
    bloc.controller.stop();
    bloc.controller.reset();
  }

//login
  login() {
    BlocProvider.of<AuthBloc>(context).add(
      LoginEvent(email: bloc.email!, password: bloc.password!),
    );
  }

  //register
  register() {
    BlocProvider.of<AuthBloc>(context).add(
      RegisterEvent(
        name: bloc.name!,
        email: bloc.email!,
        password: bloc.password!,
      ),
    );
  }

  requestPass() {
    navigateToAnotherPage();
  }

  //navigate to another page
  navigateToAnotherPage() async {
    await Future.delayed(Duration(milliseconds: 350));
    GoRouter.of(context).pushReplacement(
      _authMode == AuthMode.ResetPassword
          ? createPassPath
          : _authMode == AuthMode.Login
              ? homePath
              : interestedInWorkPath,
      extra: _authMode == AuthMode.Login
          ? 0
          : {
              StringsEn.icon: AppAssets.resetPassIcon,
              StringsEn.title: StringsEn.checkYourEmail,
              StringsEn.subTitle: StringsEn.weHaveSentAresetPassword,
              StringsEn.labelButton: StringsEn.openEmailApp,
              StringsEn.path: createPassPath,
            },
    );
  }
}
