import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_circle_button.dart';
import 'package:jobsque/core/widgets/text_field.dart';

import 'filter_sheet_messages_body.dart';

class SectionFilteringMessages extends StatelessWidget {
  const SectionFilteringMessages({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ///show message filter
    _showMessageFilterSheet(BuildContext context) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return FilterMessagesSheetBody();
        },
      );
    }

    return Row(
      children: [
        SizedBox(width: size.width * .04.w),
        //search field
        Expanded(
          child: Padding(
            padding: AppConsts.mainPadding,
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
