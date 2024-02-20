import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/features/complete_profile/presentation/view_models/add_experience_cubit/add_experience_cubit.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/widgets/customButton.dart';
import '../../../../../core/widgets/small_loading_widget.dart';
import '../../../../../core/widgets/custom_filter_text_field.dart';
import 'custom_check_box.dart';

class CustomExperienceComponent extends StatefulWidget {
  const CustomExperienceComponent({super.key});

  @override
  State<CustomExperienceComponent> createState() =>
      _CustomExperienceComponentState();
}

class _CustomExperienceComponentState extends State<CustomExperienceComponent> {
  late AddExperienceCubit bloc;
  bool isLoad = false;

  @override
  initState() {
    bloc = BlocProvider.of<AddExperienceCubit>(context);
    bloc.typeOfWork = bloc.dropDownButtonsLabel[0];
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
          child: widget!),
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: AppConsts.decorationRadius8,
      child: Padding(
        padding: AppConsts.allPadding8,
        child: BlocConsumer<AddExperienceCubit, AddExperienceState>(
          listener: (context, state) {
            if (state is AddedLoading) {
              isLoad = true;
            } else if (state is AddedSuccess) {
              isLoad = false;
              GoRouter.of(context).pop();
            } else if (state is AddedFailure) {
              isLoad = false;
              showSnack(
                context,
                message: state.message,
                background: AppConsts.danger500,
              );
            }
          },
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
                Center(
                  child: AspectRatio(
                    aspectRatio: AppConsts.aspectRatioButtonAuth,
                    child: Visibility(
                      visible: !isLoad,
                      replacement: LoadingWidget(),
                      child: CustomButton(
                        text: StringsEn.save,
                        onTap: () async {
                          await bloc.addExperience();
                        },
                      ),
                    ),
                  ),
                ),
                const AspectRatio(aspectRatio: AppConsts.aspect16on1),
              ],
            );
          },
        ),
      ),
    );
  }
}
