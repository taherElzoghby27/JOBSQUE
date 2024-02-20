import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/custom_filter_text_field.dart';

import '../../../../../core/widgets/small_loading_widget.dart';

class CustomEducationComponent extends StatefulWidget {
  const CustomEducationComponent({super.key});

  @override
  State<CustomEducationComponent> createState() =>
      _CustomEducationComponentState();
}

class _CustomEducationComponentState extends State<CustomEducationComponent> {
  DateTime? startYear;
  DateTime? endYear;

  ///select start
  selectStartYear(context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      builder: (context, widget) => Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light().copyWith(
              primary: AppConsts.primary500,
            ),
          ),
          child: widget!),
    ).then(
      (value) {
        if (value == null) {
          return;
        } else {
          setState(() {
            startYear = value;
          });
        }
      },
    );
  }

  ///select end
  selectEndYear(context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      builder: (context, widget) => Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light().copyWith(
              primary: AppConsts.primary500,
            ),
          ),
          child: widget!),
    ).then(
      (value) {
        if (value == null) {
          return;
        } else {
          setState(() {
            endYear = value;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppConsts.decorationRadius8,
      child: Padding(
        padding: AppConsts.allPadding8,
        child: Column(
          children: [
            //university
            CustomFilterTextField(
              label: StringsEn.university,
              star: StringsEn.star,
              hint: StringsEn.university,
            ),
            const AspectRatio(aspectRatio: AppConsts.aspect16on1),
            //title
            CustomFilterTextField(
              label: StringsEn.title,
              hint: StringsEn.title,
            ),
            const AspectRatio(aspectRatio: AppConsts.aspect16on1),

            //start year
            CustomFilterTextField(
              label: StringsEn.startYear,
              hint: startYear == null
                  ? StringsEn.defaultDate
                  : DateFormat(StringsEn.formatDate).format(startYear!),
              suffixIcon: IconButton(
                onPressed: () => selectStartYear(context),
                icon: Icon(Icons.calendar_month),
              ),
              readOnly: true,
              onChanged: (String? value) {},
            ),
            const AspectRatio(aspectRatio: AppConsts.aspect16on1),
            //end year
            CustomFilterTextField(
              label: StringsEn.endYear,
              hint: endYear == null
                  ? StringsEn.defaultDate
                  : DateFormat(StringsEn.formatDate).format(endYear!),
              suffixIcon: IconButton(
                onPressed: () => selectEndYear(context),
                icon: Icon(Icons.calendar_month),
              ),
              readOnly: true,
              onChanged: (String? value) {},
            ),
            const AspectRatio(aspectRatio: AppConsts.aspect16on3),
            //save
            Center(
              child: AspectRatio(
                aspectRatio: AppConsts.aspectRatioButtonAuth,
                child: Visibility(
                  visible: true,
                  replacement: const LoadingWidget(),
                  child: CustomButton(
                    text: StringsEn.save,
                    onTap: () {},
                  ),
                ),
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          ],
        ),
      ),
    );
  }
}
