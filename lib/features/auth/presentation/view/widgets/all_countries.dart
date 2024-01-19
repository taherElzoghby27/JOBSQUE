import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/features/auth/presentation/view_model/work_location_cubit/work_location_cubit.dart';

import 'country_widget.dart';

class AllCountryWidget extends StatelessWidget {
  const AllCountryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkLocationCubit, WorkLocationState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<WorkLocationCubit>(context);
        return Column(
          children: [
            Row(
              children: [
                CountryWidget(
                  label: StringsEn.malaysia,
                  flag: AppAssets.malaysia,
                  onTap: () => bloc.toggleWorkInterest(
                    key: StringsEn.malaysia,
                    status: bloc.workLocation[StringsEn.malaysia] == true
                        ? false
                        : true,
                  ),
                  isSelected: bloc.getStatus(key: StringsEn.malaysia),
                ),
                CountryWidget(
                  label: StringsEn.unitedStates,
                  flag: AppAssets.unitedStates,
                  onTap: () => bloc.toggleWorkInterest(
                    key: StringsEn.unitedStates,
                    status: bloc.workLocation[StringsEn.unitedStates] == true
                        ? false
                        : true,
                  ),
                  isSelected: bloc.getStatus(key: StringsEn.unitedStates),
                ),
              ],
            ),
            Row(
              children: [
                CountryWidget(
                  label: StringsEn.singapore,
                  flag: AppAssets.singapore,
                  onTap: () => bloc.toggleWorkInterest(
                    key: StringsEn.singapore,
                    status: bloc.workLocation[StringsEn.singapore] == true
                        ? false
                        : true,
                  ),
                  isSelected: bloc.getStatus(key: StringsEn.singapore),
                ),
                CountryWidget(
                  label: StringsEn.indonesia,
                  flag: AppAssets.indonesia,
                  onTap: () => bloc.toggleWorkInterest(
                    key: StringsEn.indonesia,
                    status: bloc.workLocation[StringsEn.indonesia] == true
                        ? false
                        : true,
                  ),
                  isSelected: bloc.getStatus(key: StringsEn.indonesia),
                ),
              ],
            ),
            Row(
              children: [
                CountryWidget(
                  label: StringsEn.philiphines,
                  flag: AppAssets.philiphines,
                  onTap: () => bloc.toggleWorkInterest(
                    key: StringsEn.philiphines,
                    status: bloc.workLocation[StringsEn.philiphines] == true
                        ? false
                        : true,
                  ),
                  isSelected: bloc.getStatus(key: StringsEn.philiphines),
                ),
                CountryWidget(
                  label: StringsEn.polandia,
                  flag: AppAssets.polandia,
                  onTap: () => bloc.toggleWorkInterest(
                    key: StringsEn.polandia,
                    status: bloc.workLocation[StringsEn.polandia] == true
                        ? false
                        : true,
                  ),
                  isSelected: bloc.getStatus(key: StringsEn.polandia),
                ),
              ],
            ),
            Row(
              children: [
                CountryWidget(
                  label: StringsEn.vietnam,
                  flag: AppAssets.vietnam,
                  onTap: () => bloc.toggleWorkInterest(
                    key: StringsEn.vietnam,
                    status: bloc.workLocation[StringsEn.vietnam] == true
                        ? false
                        : true,
                  ),
                  isSelected: bloc.getStatus(key: StringsEn.vietnam),
                ),
                CountryWidget(
                  label: StringsEn.china,
                  flag: AppAssets.china,
                  onTap: () => bloc.toggleWorkInterest(
                    key: StringsEn.china,
                    status: bloc.workLocation[StringsEn.china] == true
                        ? false
                        : true,
                  ),
                  isSelected: bloc.getStatus(key: StringsEn.china),
                ),
                CountryWidget(
                  label: StringsEn.india,
                  flag: AppAssets.india,
                  onTap: () => bloc.toggleWorkInterest(
                    key: StringsEn.india,
                    status: bloc.workLocation[StringsEn.india] == true
                        ? false
                        : true,
                  ),
                  isSelected: bloc.getStatus(key: StringsEn.india),
                ),
              ],
            ),
            Row(
              children: [
                CountryWidget(
                  label: StringsEn.saudiArabia,
                  flag: AppAssets.saudiArabia,
                  onTap: () => bloc.toggleWorkInterest(
                    key: StringsEn.saudiArabia,
                    status: bloc.workLocation[StringsEn.saudiArabia] == true
                        ? false
                        : true,
                  ),
                  isSelected: bloc.getStatus(key: StringsEn.saudiArabia),
                ),
                CountryWidget(
                  label: StringsEn.canada,
                  flag: AppAssets.canada,
                  onTap: () => bloc.toggleWorkInterest(
                    key: StringsEn.canada,
                    status: bloc.workLocation[StringsEn.canada] == true
                        ? false
                        : true,
                  ),
                  isSelected: bloc.getStatus(key: StringsEn.canada),
                ),
              ],
            ),
            Row(
              children: [
                CountryWidget(
                  label: StringsEn.brazil,
                  flag: AppAssets.brazil,
                  onTap: () => bloc.toggleWorkInterest(
                    key: StringsEn.brazil,
                    status: bloc.workLocation[StringsEn.brazil] == true
                        ? false
                        : true,
                  ),
                  isSelected: bloc.getStatus(key: StringsEn.brazil),
                ),
                CountryWidget(
                  label: StringsEn.argentina,
                  flag: AppAssets.argentina,
                  onTap: () => bloc.toggleWorkInterest(
                    key: StringsEn.argentina,
                    status: bloc.workLocation[StringsEn.argentina] == true
                        ? false
                        : true,
                  ),
                  isSelected: bloc.getStatus(key: StringsEn.argentina),
                ),
                CountryWidget(
                  label: StringsEn.egypt,
                  flag: AppAssets.egypt,
                  onTap: () => bloc.toggleWorkInterest(
                    key: StringsEn.egypt,
                    status: bloc.workLocation[StringsEn.egypt] == true
                        ? false
                        : true,
                  ),
                  isSelected: bloc.getStatus(key: StringsEn.egypt),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
