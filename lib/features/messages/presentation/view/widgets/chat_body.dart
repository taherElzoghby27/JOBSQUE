import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/core/widgets/custom_button_three_widget.dart';
import 'package:jobsque/features/messages/presentation/view/widgets/section_chat.dart';
import 'package:jobsque/features/messages/presentation/view/widgets/section_send_message.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ///show setting chat
    _showSettingChatSheet(BuildContext context) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return AspectRatio(
            aspectRatio: AppConsts.aspect2point5on3,
            child: Container(
              width: double.infinity,
              decoration: AppConsts.decorationSheet,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                  horizontal: 20.w,
                ),
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
                    SizedBox(height: size.height * .03.h),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Column(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        //back   title   settings
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pop(),
          image: AppAssets.twitter,
          title: StringsEn.twitter,
          trailingWidget: Icon(Icons.more_horiz, color: AppConsts.neutral900),
          trailingOnTap: () => _showSettingChatSheet(context),
        ),
        //chat
        const SectionChat(),
        //field ->write a messsage
        Padding(
          padding: AppConsts.mainPadding,
          child: const SectionSendMessage(),
        ),
      ],
    );
  }
}
