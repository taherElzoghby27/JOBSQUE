import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/fake_data.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/core/widgets/logo_title_icon_widget.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';

class SectionMessages extends StatelessWidget {
  const SectionMessages({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        children: [
          //unread     read all messages
          SizedBox(
            height: size.height * .04.h,
            child: TileWidget(
              label: StringsEn.unRead,
              trailingLabel: StringsEn.readAllMessages,
              trailingOnTap: () {},
            ),
          ),
          //chats
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return FadeAnimation(
                    millSeconds: 250,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LogoTitleIconWidget(
                        logo: chats_list[index].logo,
                        jopTitle: chats_list[index].name,
                        company: chats_list[index].lastMessage,
                        country: '',
                        trailing: Text(
                          chats_list[index].time,
                          style: AppConsts.style12.copyWith(
                            color: AppConsts.primary500,
                          ),
                        ),
                        onTap: () => GoRouter.of(context).push(chatPath),
                      ),
                    ),
                  );
                },
                itemCount: chats_list.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: AppConsts.neutral200),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
