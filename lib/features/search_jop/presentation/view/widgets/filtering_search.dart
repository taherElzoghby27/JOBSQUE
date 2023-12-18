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
import 'package:jobsque/features/search_jop/presentation/view_model/search_bloc/search_bloc.dart';

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
          return Container(
            height: size.height * .9.h,
            width: double.infinity,
            decoration: AppConsts.decorationSheet,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 20.w,
              ),
              child: BlocProvider(
                create: (_) => SearchBloc(
                  jobFilterRepo: getIt.get<FilterJobsRepoImplementation>(),
                ),
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    SearchBloc bloc = BlocProvider.of<SearchBloc>(context);
                    String salary = bloc.salary;
                    if (state is ChangedSalaryState) {
                      salary = state.salary;
                    }
                    return Column(
                      children: [
                        CustomAppBar(
                          leadingOnTap: () => GoRouter.of(context).pop(),
                          title: StringsEn.setFilter,
                          trailingOnTap: () => bloc.add(ResetEvent()),
                          trailingWidget: Text(
                            StringsEn.reset,
                            style: TextStyle(color: AppConsts.primary500),
                          ),
                        ),
                        SizedBox(height: size.height * .02.w),

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
                        SizedBox(height: size.height * .02.w),

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
                        SizedBox(height: size.height * .02.w),

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
                            onChanged: (String? value) => bloc.add(
                              ChangedSalaryEvent(value: value!),
                            ),
                          ),
                          readOnly: true,
                        ),
                        SizedBox(height: size.height * .02.w),

                        ///jop type
                        CustomComponentJopType(),
                        SizedBox(height: size.height * .15.w),

                        ///show result
                        SizedBox(
                          height: size.height * .06.h,
                          width: size.width * .85.w,
                          child: CustomButton(
                            text: StringsEn.showResult,
                            onTap: () {
                              //show result
                              bloc.add(
                                SearchingEvent(
                                  searchText: bloc.titleJopCont.text,
                                  location: bloc.locationCont.text,
                                ),
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
          return Container(
            height: size.height * .35.h,
            width: double.infinity,
            decoration: AppConsts.decorationSheet,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 20.w,
              ),
              child: Column(
                children: [
                  CustomAppBar(
                    title: StringsEn.on_site,
                  ),

                  SizedBox(height: size.height * .04.w),
                  Wrap(
                    runSpacing: 6,
                    spacing: 6,
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

                  SizedBox(height: size.height * .04.w),

                  ///show result
                  SizedBox(
                    height: size.height * .06.h,
                    width: size.width * .85.w,
                    child: CustomButton(
                      text: StringsEn.showResult,
                      onTap: () {},
                    ),
                  ),
                ],
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
