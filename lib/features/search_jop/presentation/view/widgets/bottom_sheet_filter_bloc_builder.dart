import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/features/home/data/repo/home_repo_implementation.dart';
import 'package:jobsque/features/search_jop/presentation/view_model/search_bloc/search_cubit.dart';
import 'package:jobsque/service_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque/core/consts/data.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/core/widgets/custom_filter_text_field.dart';

import 'custom_component_jop_type.dart';

class BottomSheetFilterBlocBuilder extends StatefulWidget {
  const BottomSheetFilterBlocBuilder({super.key, required this.ctx});

  final BuildContext ctx;

  @override
  State<BottomSheetFilterBlocBuilder> createState() =>
      _BottomSheetFilterBlocBuilderState();
}

class _BottomSheetFilterBlocBuilderState
    extends State<BottomSheetFilterBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: BlocProvider(
        create: (_) => SearchCubit(
          getIt.get<FilterJobsRepoImplementation>(),
        ),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            SearchCubit bloc = BlocProvider.of<SearchCubit>(widget.ctx);
            String salary = bloc.salary;
            if (state is ChangedSalaryState) {
              salary = state.salary;
            }
            return ListView(
              children: [
                const AspectRatio(aspectRatio: AppConsts.aspect16on1),
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
                    hint: Text('\t\t\t\t\t\t\t\t\t\t\t\t\t\t${salary}'),
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
                      GoRouter.of(context).pop();
                      await bloc.search(
                        searchText: bloc.titleJopCont.text,
                        location: bloc.locationCont.text,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
