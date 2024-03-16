import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jobsque/core/widgets/custom_filter_text_field.dart';
import 'package:jobsque/features/complete_profile/presentation/view_models/add_education_cubit/add_education_cubit.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';

class BlocConsumerDateFieldsEducation extends StatefulWidget {
  const BlocConsumerDateFieldsEducation({super.key});

  @override
  State<BlocConsumerDateFieldsEducation> createState() => _BlocConsumerDateFieldsEducationState();
}

class _BlocConsumerDateFieldsEducationState extends State<BlocConsumerDateFieldsEducation> {
  late AddEducationCubit bloc;
  DateTime? startYear;
  DateTime? endYear;

  @override
  void initState() {
    bloc = BlocProvider.of<AddEducationCubit>(context);
    super.initState();
  }

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
        child: widget!,
      ),
    ).then(
      (value) {
        if (value == null) {
          return;
        } else {
          bloc.changeDate(date: value, status: StringsEn.startYear);
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
          bloc.changeDate(date: value, status: StringsEn.endYear);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddEducationCubit, AddEducationState>(
      builder: (context, state) {
        return Column(
          children: [
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
            ),
            const AspectRatio(aspectRatio: AppConsts.aspect16on3),
          ],
        );
      },
      listener: (context, state) {
        if (state is ChangedDateState) {
          startYear = bloc.startYear;
          endYear = bloc.endYear;
        }
      },
    );
  }
}
