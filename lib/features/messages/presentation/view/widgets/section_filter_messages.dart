import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/handle_image.dart';
import 'package:jobsque/core/widgets/custom_circle_button.dart';
import 'package:jobsque/core/widgets/text_field.dart';

import '../../../../../core/widgets/custom_button_three_widget.dart';

class SectionFilterMessages extends StatelessWidget {
  const SectionFilterMessages({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ///show message filter
    _showMessageFilterSheet(BuildContext context) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return AspectRatio(
            aspectRatio: AppConsts.aspect13on10,
            child: Container(
              decoration: AppConsts.decorationSheet,
              child: Padding(
                padding: AppConsts.padding10h8v,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(child: HandleImageWidget(image:AppAssets.line)),
                    //message filtering
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        StringsEn.messageFilter,
                        style: AppConsts.style32.copyWith(fontSize: 18),
                      ),
                    ),
                    //unread
                    CustomButtonThreeWidget(
                      title: StringsEn.unRead,
                      trailing: Icons.arrow_forward_ios,
                      onTap: () {},
                    ),
                    //spam
                    CustomButtonThreeWidget(
                      title: StringsEn.spam,
                      trailing: Icons.arrow_forward_ios,
                      onTap: () {},
                    ),
                    //archieved
                    CustomButtonThreeWidget(
                      title: StringsEn.archived,
                      trailing: Icons.arrow_forward_ios,
                      onTap: () {},
                    ),
                    const AspectRatio(aspectRatio: AppConsts.aspect16on1),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Row(
      children: [
        SizedBox(width: size.width * .04.w),
        //search field
        Expanded(
          child: Padding(
            padding: AppConsts.padding10h8v,
            child: CustomTextField(
              perfixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
              hint: StringsEn.searchMessages,
              controller: TextEditingController(),
            ),
          ),
        ),
        SizedBox(width: size.width * .01.w),
        //filter
        CustomCircleButton(
          icon: AppAssets.filter,
          onTap: () => _showMessageFilterSheet(context),
        ),
        SizedBox(width: size.width * .04.w),
      ],
    );
  }
}
