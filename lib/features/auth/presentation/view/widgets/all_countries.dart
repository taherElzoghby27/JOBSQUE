import 'package:flutter/cupertino.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';

import 'country_widget.dart';

class AllCountryWidget extends StatelessWidget {
  const AllCountryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CountryWidget(
              label: StringsEn.malaysia,
              flag: AppAssets.malaysia,
              onTap: () {},
              isSelected: false,
            ),
            CountryWidget(
              label: StringsEn.unitedStates,
              flag: AppAssets.unitedStates,
              onTap: () {},
              isSelected: true,
            ),
          ],
        ),
        Row(
          children: [
            CountryWidget(
              label: StringsEn.singapore,
              flag: AppAssets.singapore,
              onTap: () {},
              isSelected: true,
            ),
            CountryWidget(
              label: StringsEn.indonesia,
              flag: AppAssets.indonesia,
              onTap: () {},
              isSelected: true,
            ),
          ],
        ),
        Row(
          children: [
            CountryWidget(
              label: StringsEn.philiphines,
              flag: AppAssets.philiphines,
              onTap: () {},
              isSelected: true,
            ),
            CountryWidget(
              label: StringsEn.polandia,
              flag: AppAssets.polandia,
              onTap: () {},
              isSelected: true,
            ),
          ],
        ),
        Row(
          children: [
            CountryWidget(
              label: StringsEn.vietnam,
              flag: AppAssets.vietnam,
              onTap: () {},
              isSelected: true,
            ),
            CountryWidget(
              label: StringsEn.china,
              flag: AppAssets.china,
              onTap: () {},
              isSelected: true,
            ),
            CountryWidget(
              label: StringsEn.india,
              flag: AppAssets.india,
              onTap: () {},
              isSelected: true,
            ),
          ],
        ),
        Row(
          children: [
            CountryWidget(
              label: StringsEn.saudiArabia,
              flag: AppAssets.saudiArabia,
              onTap: () {},
              isSelected: true,
            ),
            CountryWidget(
              label: StringsEn.canada,
              flag: AppAssets.canada,
              onTap: () {},
              isSelected: true,
            ),
          ],
        ),
        Row(
          children: [
            CountryWidget(
              label: StringsEn.brazil,
              flag: AppAssets.brazil,
              onTap: () {},
              isSelected: true,
            ),
            CountryWidget(
              label: StringsEn.argentina,
              flag: AppAssets.argentina,
              onTap: () {},
              isSelected: true,
            ),
            CountryWidget(
              label: StringsEn.egypt,
              flag: AppAssets.egypt,
              onTap: () {},
              isSelected: true,
            ),
          ],
        ),
      ],
    );
  }
}
