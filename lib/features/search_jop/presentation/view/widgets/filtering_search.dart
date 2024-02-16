import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/data.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/services/service_locator.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/core/widgets/jop_type_component_button.dart';
import 'package:jobsque/features/home/data/repo/home_repo_implementation.dart';
import 'package:jobsque/core/widgets/custom_filter_text_field.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/custom_type_jop_widget.dart';
import 'package:jobsque/features/search_jop/presentation/view_model/search_bloc/search_cubit.dart';

import 'custom_component_jop_type.dart';

class SectionFiltering extends StatelessWidget {
  const SectionFiltering({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ///filtering sheet
    _showFilteringSheet(BuildContext context) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return AspectRatio(
            aspectRatio: AppConsts.aspect10on19,
            child: Container(
              decoration: AppConsts.decorationSheet,
              child: Padding(
                padding: AppConsts.mainPadding,
                child: BlocProvider(
                  create: (_) => SearchCubit(
                    getIt.get<FilterJobsRepoImplementation>(),
                  ),
                  child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      SearchCubit bloc = BlocProvider.of<SearchCubit>(context);
                      String salary = bloc.salary;
                      if (state is ChangedSalaryState) {
                        salary = state.salary;
                      }
                      return ListView(
                        children: [
                          CustomAppBar(
                            leadingOnTap: () => GoRouter.of(context).pop(),
                            title: StringsEn.setFilter,
                            trailingOnTap: () => bloc.resetEvent(),
                            trailingWidget: Text(
                              StringsEn.reset,
                              style: TextStyle(color: AppConsts.primary500),
                            ),
                          ),
                          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

                          ///jop title
                          CustomFilterTextField(
                            label: StringsEn.jobTitle,
                            hint: StringsEn.jobTitle,
                            perfixIcon: Icon(
                              FontAwesomeIcons.briefcase,
                              size: 16.sp,
                            ),
                            controller: bloc.titleJopCont,
                          ),
                          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

                          ///location
                          CustomFilterTextField(
                            label: StringsEn.location,
                            hint: StringsEn.location,
                            perfixIcon: Icon(
                              Icons.location_on_outlined,
                              size: 16.sp,
                            ),
                            controller: bloc.locationCont,
                          ),
                          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

                          ///salary

                          CustomFilterTextField(
                            label: StringsEn.salary,
                            hint: StringsEn.salary,
                            perfixIcon: Icon(
                              FontAwesomeIcons.circleDollarToSlot,
                              size: 16.sp,
                            ),
                            suffixIcon: DropdownButton<String>(
                              hint: Text('\t\t\t\t\t\t\t\t\t\t\t\t\t\t$salary'),
                              underline: Container(),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down),
                              items: salaries
                                  .map(
                                    (e) => DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                      onTap: () {},
                                    ),
                                  )
                                  .toList(),
                              onChanged: (String? value) => bloc.ChangeSalary(
                                value: value!,
                              ),
                            ),
                            readOnly: true,
                          ),
                          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

                          ///jop type
                          const CustomComponentJopType(),
                          const AspectRatio(aspectRatio: AppConsts.aspect16on3),

                          ///show result
                          AspectRatio(
                            aspectRatio: AppConsts.aspectRatioButtonAuth,
                            child: CustomButton(
                              text: StringsEn.showResult,
                              onTap: () async {
                                //show result
                                await bloc.search(
                                  searchText: bloc.titleJopCont.text,
                                  location: bloc.locationCont.text,
                                );
                                //navigate to pop
                                GoRouter.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
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
          return AspectRatio(
            aspectRatio: AppConsts.aspect13on9,
            child: Container(
              decoration: AppConsts.decorationSheet,
              child: Padding(
                padding: AppConsts.mainPadding,
                child: Column(
                  children: [
                    CustomAppBar(
                      leadingOnTap: () => GoRouter.of(context).pop(),
                      title: StringsEn.on_site,
                    ),

                    const AspectRatio(aspectRatio: AppConsts.aspect16on2),
                    Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: [
                        CustomTypeJopWidget(
                          label: StringsEn.remote,
                          labelColor: AppConsts.primary500,
                          onTap: () {},
                        ),
                        CustomTypeJopWidget(
                          label: StringsEn.onSite,
                          labelColor: AppConsts.neutral500,
                          onTap: () {},
                        ),
                        CustomTypeJopWidget(
                          label: StringsEn.hyprid,
                          labelColor: AppConsts.neutral500,
                          onTap: () {},
                        ),
                        CustomTypeJopWidget(
                          label: StringsEn.any,
                          labelColor: AppConsts.primary500,
                          onTap: () {},
                        ),
                      ],
                    ),

                    const AspectRatio(aspectRatio: AppConsts.aspect16on3),

                    ///show result
                    AspectRatio(
                      aspectRatio: AppConsts.aspectRatioButtonAuth,
                      child: CustomButton(
                        text: StringsEn.showResult,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
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
