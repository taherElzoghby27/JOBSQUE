import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/custom_filter_text_field.dart';

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
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: AppConsts.decorationRadius8,
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          children: [
            //university
            CustomFilterTextField(
              label: StringsEn.university,
              star: StringsEn.star,
              hint: StringsEn.university,
            ),
            SizedBox(height: size.height * .022.w),

            //title
            CustomFilterTextField(
              label: StringsEn.title,
              hint: StringsEn.title,
            ),
            SizedBox(height: size.height * .022.w),

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
            SizedBox(height: size.height * .022.w),
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
            SizedBox(height: size.height * .05.h),
            //save
            Center(
              child: SizedBox(
                height: size.height * .055.h,
                width: size.width * .9.w,
                child: Visibility(
                  visible: true,
                  replacement: LoadingWidget(),
                  child: CustomButton(
                    text: StringsEn.save,
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
