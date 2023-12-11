import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/messages/presentation/view/widgets/section_filter_messages.dart';
import 'package:jobsque/features/messages/presentation/view/widgets/section_messages.dart';
import '../../../../../core/consts/routesPage.dart';

class MessagesBody extends StatelessWidget {
  const MessagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;



    return Column(
      children: [
        SizedBox(height: size.height * .02.h),

        //custom appBar
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pushReplacement(homePath),
          title: StringsEn.messages,
          trailingWidget: Container(),
        ),
        SizedBox(height: size.height * .02.h),
        SectionFilterMessages(),
        //messages
        SectionMessages(),
        // EmptyWidget(
        //   icon: AppAssets.noMessages,
        //   title: StringsEn.youHaveNotReceivedMessages,
        //   subTitle: StringsEn.onceYourAppHasReached,
        // ),
      ],
    );
  }
}
