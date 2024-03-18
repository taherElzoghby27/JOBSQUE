import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/handle_image.dart';

import '../../../../../core/consts/assets.dart';
import '../../../../../core/consts/routesPage.dart';

class CustomAppBarOnBoarding extends StatelessWidget {
  const CustomAppBarOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: AppConsts.padding20h25v,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: size.height * .02,
            child: HandleImageWidget(image: AppAssets.logo),
          ),

          ///skip
          TextButton(
            onPressed: () => GoRouter.of(context).pushReplacement(authPath),
            child: Text(StringsEn.skip, style: AppConsts.style16),
          ),
        ],
      ),
    );
  }
}
