
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque/core/consts/style.dart';

import '../../../../../core/consts/assets.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/custom_button_three_widget.dart';

class SettingChatSheetBody extends StatelessWidget {
  const SettingChatSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspect2point5on3,
      child: Container(
        width: double.infinity,
        decoration: AppConsts.decorationSheet,
        child: Padding(
          padding: AppConsts.padding10Horiz,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(child: SvgPicture.asset(AppAssets.line)),
              //visit jop post
              CustomButtonThreeWidget(
                leading: Icon(FontAwesomeIcons.briefcase),
                title: StringsEn.visitJobPost,
                trailing: Icons.arrow_forward_ios,
                onTap: () {},
              ),
              //view my application
              CustomButtonThreeWidget(
                leading: Icon(FontAwesomeIcons.fileLines),
                title: StringsEn.viewMyApp,
                trailing: Icons.arrow_forward_ios,
                onTap: () {},
              ),
              //mark as un read
              CustomButtonThreeWidget(
                leading: Icon(FontAwesomeIcons.envelope),
                title: StringsEn.markAsUnread,
                trailing: Icons.arrow_forward_ios,
                onTap: () {},
              ),
              //mute
              CustomButtonThreeWidget(
                leading: Icon(FontAwesomeIcons.bellSlash),
                title: StringsEn.mute,
                trailing: Icons.arrow_forward_ios,
                onTap: () {},
              ),
              //archieve
              CustomButtonThreeWidget(
                leading: Icon(FontAwesomeIcons.boxArchive),
                title: StringsEn.archive,
                trailing: Icons.arrow_forward_ios,
                onTap: () {},
              ),
              //delete conversition
              CustomButtonThreeWidget(
                leading: Icon(FontAwesomeIcons.trash),
                title: StringsEn.deleteConversion,
                trailing: Icons.arrow_forward_ios,
                onTap: () {},
              ),
              const AspectRatio(aspectRatio: AppConsts.aspect16on1),
            ],
          ),
        ),
      ),
    );
  }
}
