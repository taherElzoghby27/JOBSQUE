import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/assets.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/custom_button_with_widget.dart';

class SignWithGoogleAndFaceBookWidget extends StatelessWidget {
  const SignWithGoogleAndFaceBookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        ///google
        Expanded(
          child: CustomButtonWithWidget(
            label: StringsEn.google,
            icon: AppAssets.google,
            onTap: () {},
          ),
        ),
        SizedBox(width: size.width * .025.w),

        ///facebook
        Expanded(
          child: CustomButtonWithWidget(
            label: StringsEn.facebook,
            icon: AppAssets.facebook,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
