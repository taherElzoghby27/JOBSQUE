import 'package:flutter/material.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import 'remeber_me_widget.dart';

class RemeberWidget extends StatelessWidget {
  const RemeberWidget({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: RemeberMeWidget(),
        ),
        Spacer(),
        Expanded(
          flex: 3,
          child: TextButton(
            onPressed: onTap,
            child: Text(
              StringsEn.forgotPass,
              style: AppConsts.style14.copyWith(
                color: AppConsts.primary500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
