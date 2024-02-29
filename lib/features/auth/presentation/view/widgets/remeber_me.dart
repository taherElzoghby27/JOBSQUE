
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import 'remeber_me_widget.dart';

class RemeberWidget extends StatelessWidget {
  const RemeberWidget({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const RemeberMeWidget(),
        SizedBox(width: size.width * .2.w),
        TextButton(
          onPressed: onTap,
          child: Text(
            StringsEn.forgotPass,
            style: AppConsts.style14.copyWith(
              color: AppConsts.primary500,
            ),
          ),
        ),
      ],
    );
  }
}
