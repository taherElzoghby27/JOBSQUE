import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_image.dart';

class SectionEditPhoto extends StatelessWidget {
  const SectionEditPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //image
        CustomImage(image: AppAssets.board3),
        //change photo
        TextButton(
          onPressed: () {},
          child: Text(
            StringsEn.changePhoto,
            style: TextStyle(color: AppConsts.primary500),
          ),
        ),
      ],
    );
  }
}
