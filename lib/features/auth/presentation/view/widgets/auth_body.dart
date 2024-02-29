import 'package:flutter/material.dart';
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

class AuthBody extends StatefulWidget {
  const AuthBody({super.key});

  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late AnimationController controller;
  late Animation<Offset> offsetAnimation;

  @override
  void initState() {
    //init controller
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    //offset animation
    offsetAnimation = tweenSequence().animate(controller);
    super.initState();
  }

  AuthMode _authMode = AuthMode.SignUp;
  String? name;
  String? email;
  String? password;

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
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
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

              ///fields
              AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return AnimatedSlide(
                    offset: offsetAnimation.value,
                    duration: const Duration(milliseconds: 200),
                    child: FieldsAuth(
                      authMode: _authMode,
                      userNameChange: (String? value) => name = value,
                      emailChange: (String? value) => email = value,
                      passwordChange: (String? value) => password = value,
                    ),
                  );
                },
              ),
              const AspectRatio(aspectRatio: AppConsts.aspect16on4),

              ///already have an account
              AlternativeAuth(
                authMode: _authMode,
                action: () => _switchAuthMode(),
              ),

              ///Create account or login or reset pass
              AuthButtonBlocConsumer(
                tapAuth: buttonAuth,
                authMode: _authMode,
                successAction: navigateToAnotherPage,
              ),
              const AspectRatio(aspectRatio: AppConsts.aspect40on1),
              _authMode == AuthMode.ResetPassword
                  ? Container()
                  : AuthWithSocial(authMode: _authMode),
            ],
          ),
        ),
      ),
    );
  }

  buttonAuth() {
    if (_formKey.currentState!.validate()) {
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

  void startAnimation() {
    if (!controller.isAnimating) {
      controller
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

  void stopAnimation() {
    if (controller.isAnimating) {
      stopAndResetAnimation();
    }
  }

  void stopAndResetAnimation() {
    controller.stop();
    controller.reset();
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

  requestPass() {
    navigateToAnotherPage();
  }

  //navigate to another page
  navigateToAnotherPage() async {
    await Future.delayed(Duration(milliseconds: 500));
    GoRouter.of(context).pushReplacement(
      _authMode == AuthMode.ResetPassword
          ? createPassPath
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
