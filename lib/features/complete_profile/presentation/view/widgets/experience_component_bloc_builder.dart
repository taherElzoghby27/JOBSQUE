import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_filter_text_field.dart';
import 'package:jobsque/features/complete_profile/presentation/view_models/add_experience_cubit/add_experience_cubit.dart';

import 'custom_check_box.dart';
import 'experience_button_bloc_consumer.dart';

class ExperienceComponentBlocBuilder extends StatelessWidget {
  const ExperienceComponentBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AddExperienceCubit>(context);

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
            bloc.changeStartYear(value: value);
          }
        },
      );
    }

    return BlocBuilder<AddExperienceCubit, AddExperienceState>(
      builder: (context, state) {
        return Column(
          children: [
            //position
            CustomFilterTextField(
              label: StringsEn.position,
              star: StringsEn.star,
              hint: StringsEn.position,
              controller: bloc.position,
            ),
            const AspectRatio(aspectRatio: AppConsts.aspect40on1),

            //type of work
            CustomFilterTextField(
              label: StringsEn.typeOfWork,
              suffixIcon: DropdownButton<String>(
                hint: Text(
                  '\t\t\t\t\t${state is ChangedTypeOfWork ? state.value : bloc.typeOfWork}',
                ),
                underline: Container(),
                isExpanded: true,
                icon: Icon(Icons.arrow_drop_down),
                onChanged: (String? value) =>
                    bloc.changeTypeOfWork(value: value!),
                items: bloc.dropDownButtonsLabel
                    .map<DropdownMenuItem<String>>(
                      (String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
              ),
              readOnly: true,
            ),
            const AspectRatio(aspectRatio: AppConsts.aspect40on1),

            //company name
            CustomFilterTextField(
              label: StringsEn.companyName,
              hint: StringsEn.companyName,
              star: StringsEn.star,
              controller: bloc.compName,
            ),
            const AspectRatio(aspectRatio: AppConsts.aspect40on1),
            // location
            CustomFilterTextField(
              label: StringsEn.location,
              hint: StringsEn.location,
              perfixIcon: Icon(Icons.location_on),
              controller: bloc.location,
            ),
            CustomCheckBox(
              label: StringsEn.imCurrWorking,
              value: state is ChangedCurrentInRole
                  ? state.value
                  : bloc.isCheckedCurrentInRole,
              onChanged: (value) => bloc.changeCurrentInRole(value: value!),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspect40on1),
            //start year
            CustomFilterTextField(
              label: StringsEn.startYear,
              star: StringsEn.star,
              hint: bloc.startYear == null
                  ? StringsEn.defaultDate
                  : DateFormat(StringsEn.formatDate).format(
                      state is ChangedDate ? state.value : bloc.startYear!,
                    ),
              suffixIcon: IconButton(
                onPressed: () => selectStartYear(context),
                icon: Icon(Icons.calendar_month),
              ),
              readOnly: true,
            ),
            const AspectRatio(aspectRatio: AppConsts.aspect16on2),
            //save
            const ExperienceButtonBlocConsumer(),
            const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          ],
        );
      },
    );
  }
}
