import 'assets.dart';
import 'strings.dart';

List<String> salaries = [
  'less than 5k',
  '5k-10k',
  '10k-15k',
  '15k-20k',
  '20k-25k',
  'more than 25k',
];

final List<List<Map<String, String>>> countries = [
  [
    {StringsEn.label: StringsEn.malaysia, StringsEn.flag: AppAssets.malaysia},
    {
      StringsEn.label: StringsEn.unitedStates,
      StringsEn.flag: AppAssets.unitedStates
    },
  ],
  [
    {StringsEn.label: StringsEn.singapore, StringsEn.flag: AppAssets.singapore},
    {StringsEn.label: StringsEn.indonesia, StringsEn.flag: AppAssets.indonesia},
  ],
  [
    {
      StringsEn.label: StringsEn.philiphines,
      StringsEn.flag: AppAssets.philiphines
    },
    {StringsEn.label: StringsEn.polandia, StringsEn.flag: AppAssets.polandia},
  ],
  [
    {StringsEn.label: StringsEn.vietnam, StringsEn.flag: AppAssets.vietnam},
    {StringsEn.label: StringsEn.china, StringsEn.flag: AppAssets.china},
    {StringsEn.label: StringsEn.india, StringsEn.flag: AppAssets.india},
  ],
  [
    {StringsEn.label: StringsEn.china, StringsEn.flag: AppAssets.china},
    {
      StringsEn.label: StringsEn.saudiArabia,
      StringsEn.flag: AppAssets.saudiArabia
    },
    {StringsEn.label: StringsEn.egypt, StringsEn.flag: AppAssets.egypt},
  ],
  [
    {StringsEn.label: StringsEn.canada, StringsEn.flag: AppAssets.canada},
    {StringsEn.label: StringsEn.brazil, StringsEn.flag: AppAssets.brazil},
    {StringsEn.label: StringsEn.argentina, StringsEn.flag: AppAssets.argentina},
  ],
];
