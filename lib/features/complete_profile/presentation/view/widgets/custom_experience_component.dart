import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/widgets/customButton.dart';
import '../../../../../core/widgets/small_loading_widget.dart';
import '../../../../search_jop/presentation/view/widgets/custom_filter_text_field.dart';
import 'custom_check_box.dart';

class CustomExperienceComponent extends StatefulWidget {
  const CustomExperienceComponent({super.key});

  @override
  State<CustomExperienceComponent> createState() =>
      _CustomExperienceComponentState();
}

class _CustomExperienceComponentState extends State<CustomExperienceComponent> {
  DateTime? startYear;
  bool isCheckedCurrentInRole = false;

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: AppConsts.decorationRadius8,
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          children: [
            //position
            CustomFilterTextField(
              label: StringsEn.position,
              star: StringsEn.star,
              hint: StringsEn.position,
            ),
            SizedBox(height: size.height * .022.w),

            //type of work
            CustomFilterTextField(
              label: StringsEn.typeOfWork,
              suffixIcon: DropdownButton<String>(
                hint: Text('\t\t\t\t\t${StringsEn.fullTime}'),
                underline: Container(),
                isExpanded: true,
                icon: Icon(Icons.arrow_drop_down),
                items: [
                  DropdownMenuItem<String>(
                    value: StringsEn.partTime,
                    child: Text(StringsEn.partTime),
                    onTap: () {},
                  ),
                ],
                onChanged: (String? value) {},
              ),
              readOnly: true,
            ),
            SizedBox(height: size.height * .022.w),

            //company name
            CustomFilterTextField(
              label: StringsEn.companyName,
              hint: StringsEn.companyName,
              star: StringsEn.star,
              onChanged: (String? value) {},
            ),
            SizedBox(height: size.height * .022.w),
            // location
            CustomFilterTextField(
              label: StringsEn.location,
              hint: StringsEn.location,
              perfixIcon: Icon(Icons.location_on),
              onChanged: (String? value) {},
            ),
            CustomCheckBox(
              label: StringsEn.imCurrWorking,
              value: isCheckedCurrentInRole,
              onChanged: (value) {
                setState(() => isCheckedCurrentInRole = value!);
              },
            ),
            SizedBox(height: size.height * .01.h),
            //start year
            CustomFilterTextField(
              label: StringsEn.startYear,
              star: StringsEn.star,
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
