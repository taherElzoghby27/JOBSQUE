import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
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

import '../../../../../../../../core/consts/routesPage.dart';
import '../../../../../../../../core/consts/strings.dart';

class LoginSecurityAuthBody extends StatelessWidget {
  LoginSecurityAuthBody({super.key, required this.path});

  String path;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bloc = BlocProvider.of<UpdateNamePassCubit>(context);
    bool load = false;
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
          );
          //navigate to home
          Future.delayed(
            Duration(seconds: 2),
            () => GoRouter.of(context).push(homePath),
          );
        } else if (state is Fail) {
          load = false;
          showSnack(context, message: state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: load,
          progressIndicator: LoadingWidget(
            height: size.height * .4.h,
          ),
          child: Column(
            children: [
              SizedBox(height: size.height * .02.h),
              CustomAppBar(
                leadingOnTap: () => GoRouter.of(context).pop(),
                title: path == StringsEn.emailAddress
                    ? StringsEn.emailAddress
                    : path == StringsEn.phoneNumber
                        ? StringsEn.phoneNumber
                        : StringsEn.changePassword,
                trailingWidget: Container(),
              ),

              path == StringsEn.emailAddress
                  ? EmailAddressPage()
                  : path == StringsEn.changePassword
                      ? ChangePassComponent()
                      : PhoneNumberComponent(),
              Spacer(),
              //button
              SizedBox(
                height: size.height * .055.h,
                width: size.width * .9.w,
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
              SizedBox(height: size.height * .035.w),
            ],
          ),
        );
      },
    );
  }
}
