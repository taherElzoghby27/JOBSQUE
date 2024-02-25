import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/jop_type_component_button.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/bottom_sheet_filter_bloc_builder.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/remote_sheet_widget.dart';

class SectionFiltering extends StatelessWidget {
  const SectionFiltering({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ///filtering sheet
    _showFilteringSheet(BuildContext ctx) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return AspectRatio(
            aspectRatio: AppConsts.aspect10on19,
            child: Container(
              decoration: AppConsts.decorationSheet,
              child: BottomSheetFilterBlocBuilder(
                ctx: ctx,
              ),
            ),
          );
        },
      );
    }

    ///remoteSheet
    _showRemoteSheet(BuildContext context) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const RemoteSheetWidget();
        },
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: size.width * .01.w),
          //filter
          IconButton(
            onPressed: () => _showFilteringSheet(context),
            icon: Icon(FontAwesomeIcons.sliders),
          ),
          JopTypeComponent(
            type: StringsEn.remote,
            onTap: () => _showRemoteSheet(context),
            color: AppConsts.neutral100,
            backColor: AppConsts.primary900,
          ),
          SizedBox(width: size.width * .01.w),
          JopTypeComponent(
            type: StringsEn.fullTime,
            onTap: () {},
            color: AppConsts.neutral100,
            backColor: AppConsts.primary900,
          ),
          SizedBox(width: size.width * .01.w),
          JopTypeComponent(
            type: StringsEn.contract,
            onTap: () {},
            color: AppConsts.neutral600,
            backColor: AppConsts.neutral100,
          ),
          SizedBox(width: size.width * .01.w),
          JopTypeComponent(
            type: StringsEn.postDate,
            onTap: () {},
            color: AppConsts.neutral600,
            backColor: AppConsts.neutral100,
          ),
          SizedBox(width: size.width * .03.w),
        ],
      ),
    );
  }
}
