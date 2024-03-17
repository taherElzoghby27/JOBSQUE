import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/helper/dialog_help.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/widgets/change_pass_component.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/widgets/email_address_component.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/widgets/phone_number_component.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view_models/update_name_password_cubit/update_name_pass_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:jobsque/core/consts/style.dart';
import '../../../../../../../../core/consts/routesPage.dart';
import '../../../../../../../../core/consts/strings.dart';

class LoginSecurityAuthBody extends StatefulWidget {
  const LoginSecurityAuthBody({super.key, required this.path});

  final String path;

  @override
  State<LoginSecurityAuthBody> createState() => _LoginSecurityAuthBodyState();
}

class _LoginSecurityAuthBodyState extends State<LoginSecurityAuthBody> {
  bool load = false;
  late String path;

  @override
  void initState() {
    path = widget.path;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<UpdateNamePassCubit>(context);

    return BlocConsumer<UpdateNamePassCubit, UpdateNamePassState>(
      listener: (context, state) {
        if (state is Loading) {
          load = true;
        } else if (state is Success && path == StringsEn.emailAddress) {
          load = false;
          //navigate to update name and password
          GoRouter.of(context).push(
            loginSecurityAuthPath,
            extra: StringsEn.changePassword,
          );
        } else if (state is Success && path == StringsEn.changePassword) {
          load = false;
          //dialog success
          customDialog(
            context: context,
            title: StringsEn.success,
            subTitle: StringsEn.namePassUpdatedSuccessfully,
            readOnly: true,
          );
          //navigate to home
          Future.delayed(
            Duration(seconds: 2),
            () => GoRouter.of(context).push(
              homePath,
              extra: 0,
            ),
          );
        } else if (state is Fail) {
          load = false;
          showSnack(
            context,
            message: state.message,
            background: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: load,
          progressIndicator: const LoadingWidget(),
          child: Padding(
            padding: AppConsts.mainPadding,
            child: Column(
              children: [
                const AspectRatio(aspectRatio: AppConsts.aspect16on1),
                CustomAppBar(
                  leadingOnTap: () => GoRouter.of(context).pop(),
                  title: path == StringsEn.emailAddress
                      ? StringsEn.emailAddress
                      : path == StringsEn.phoneNumber
                          ? StringsEn.phoneNumber
                          : StringsEn.updateNamePass,
                  trailingWidget: Container(),
                ),

                path == StringsEn.emailAddress
                    ? const EmailAddressPage()
                    : path == StringsEn.changePassword
                        ? const ChangePassComponent()
                        : const PhoneNumberComponent(),
                const Spacer(),
                //button
                AspectRatio(
                  aspectRatio: AppConsts.aspectRatioButtonAuth,
                  child: CustomButton(
                    text: path == StringsEn.emailAddress
                        ? StringsEn.verify
                        : StringsEn.save,
                    onTap: () async {
                      if (path == StringsEn.emailAddress) {
                        await bloc.getOtp();
                      } else if (path == StringsEn.changePassword) {
                        await bloc.updateNamePass();
                      }
                    },
                  ),
                ),
                const AspectRatio(aspectRatio: AppConsts.aspect20on2),
              ],
            ),
          ),
        );
      },
    );
  }
}
