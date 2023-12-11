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
            ),
            CountryWidget(
              label: StringsEn.unitedStates,
              flag: AppAssets.unitedStates,
              onTap: () {},
            ),
          ],
        ),
        Row(
          children: [
            CountryWidget(
              label: StringsEn.singapore,
              flag: AppAssets.singapore,
              onTap: () {},
            ),
            CountryWidget(
              label: StringsEn.indonesia,
              flag: AppAssets.indonesia,
              onTap: () {},
            ),
          ],
        ),
        Row(
          children: [
            CountryWidget(
              label: StringsEn.philiphines,
              flag: AppAssets.philiphines,
              onTap: () {},
            ),
            CountryWidget(
              label: StringsEn.polandia,
              flag: AppAssets.polandia,
              onTap: () {},
            ),
          ],
        ),
        Row(
          children: [
            CountryWidget(
              label: StringsEn.vietnam,
              flag: AppAssets.vietnam,
              onTap: () {},
            ),
            CountryWidget(
              label: StringsEn.china,
              flag: AppAssets.china,
              onTap: () {},
            ),
            CountryWidget(
              label: StringsEn.india,
              flag: AppAssets.india,
              onTap: () {},
            ),
          ],
        ),
        Row(
          children: [
            CountryWidget(
              label: StringsEn.saudiArabia,
              flag: AppAssets.saudiArabia,
              onTap: () {},
            ),
            CountryWidget(
              label: StringsEn.canada,
              flag: AppAssets.canada,
              onTap: () {},
            ),
          ],
        ),
        Row(
          children: [
            CountryWidget(
              label: StringsEn.brazil,
              flag: AppAssets.brazil,
              onTap: () {},
            ),
            CountryWidget(
              label: StringsEn.argentina,
              flag: AppAssets.argentina,
              onTap: () {},
            ),
            CountryWidget(
              label: StringsEn.egypt,
              flag: AppAssets.egypt,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
