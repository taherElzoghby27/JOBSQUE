
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/handle_image.dart';
import 'package:jobsque/core/widgets/custom_button_three_widget.dart';

class FilterMessagesSheetBody extends StatelessWidget {
  const FilterMessagesSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspect13on10,
      child: Container(
        decoration: AppConsts.decorationSheet,
        child: Padding(
          padding: AppConsts.padding10h8v,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(child: HandleImageWidget(image: AppAssets.line)),
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
  }
}
