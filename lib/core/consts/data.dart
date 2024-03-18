import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/widgets/custom_circle_button.dart';
import 'package:jobsque/features/onBoarding/presentation/view/widgets/board_structure.dart';

import 'assets.dart';
import 'strings.dart';

List<BoardStructure> childrenPageViewOnBoarding = [
  BoardStructure(
    image: AppAssets.board1,
    subTitle: StringsEn.subTitleBoard1,
    titles: [
      TextSpan(text: StringsEn.titleBoard1),
      TextSpan(
        text: StringsEn.titleBoard11,
        style: TextStyle(color: AppConsts.primary500),
      ),
      TextSpan(text: StringsEn.titleBoard111),
    ],
  ),
  BoardStructure(
    image: AppAssets.board2,
    titles: [
      TextSpan(text: StringsEn.titleBoard2),
      TextSpan(
        text: StringsEn.titleBoard22,
        style: TextStyle(color: AppConsts.primary500),
      ),
    ],
    subTitle: StringsEn.subTitleBoard2,
  ),
  BoardStructure(
    image: AppAssets.board3,
    titles: [
      TextSpan(text: StringsEn.titleBoard3),
      TextSpan(
        text: StringsEn.titleBoard33,
        style: TextStyle(color: AppConsts.primary500),
      ),
      TextSpan(text: StringsEn.titleBoard333),
    ],
    subTitle: StringsEn.subTitleBoard3,
  ),
];
const List<String> salaries = [
  'less than 5k',
  '5k-10k',
  '10k-15k',
  '15k-20k',
  '20k-25k',
  'more than 25k',
];

const List<List<Map<String, String>>> countries = [
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

List<Map<String, dynamic>> generalDataProfile = [
  {
    StringsEn.leading: CustomCircleButton(
      icon: AppAssets.profileSvg,
      color: AppConsts.primary100,
    ),
    StringsEn.title: StringsEn.editProfile,
    StringsEn.trailing: Icons.arrow_forward_outlined,
    StringsEn.path: editProfilePath,
  },
  {
    StringsEn.leading: CustomCircleButton(
      icon: AppAssets.portfolio,
      color: AppConsts.primary100,
    ),
    StringsEn.title: StringsEn.portfolio,
    StringsEn.trailing: Icons.arrow_forward_outlined,
    StringsEn.path: portfolioPath,
  },
  {
    StringsEn.leading: CustomCircleButton(
      icon: AppAssets.global,
      color: AppConsts.primary100,
    ),
    StringsEn.title: StringsEn.language,
    StringsEn.trailing: Icons.arrow_forward_outlined,
    StringsEn.path: languagePath,
  },
  {
    StringsEn.leading: CustomCircleButton(
      icon: AppAssets.notification,
      color: AppConsts.primary100,
      colorIcon: AppConsts.primary500,
    ),
    StringsEn.title: StringsEn.notification,
    StringsEn.trailing: Icons.arrow_forward_outlined,
    StringsEn.path: notificationProfilePath,
  },
  {
    StringsEn.leading: CustomCircleButton(
      icon: AppAssets.lockSvg,
      color: AppConsts.primary100,
    ),
    StringsEn.title: StringsEn.loginAndSeurity,
    StringsEn.trailing: Icons.arrow_forward_outlined,
    StringsEn.path: loginSecurityPath,
  },
  {
    StringsEn.leading: CustomCircleButton(
      icon: AppAssets.profileSvg,
      color: AppConsts.primary100,
    ),
    StringsEn.title: StringsEn.completeProfile,
    StringsEn.trailing: Icons.arrow_forward_outlined,
    StringsEn.path: completeProfilePath,
  },
];
List<Map<String, dynamic>> othersDataProfile = [
  {
    StringsEn.title: StringsEn.accesibility,
    StringsEn.trailing: Icons.arrow_forward_outlined,
    StringsEn.path: '',
  },
  {
    StringsEn.title: StringsEn.helpCenter,
    StringsEn.trailing: Icons.arrow_forward_outlined,
    StringsEn.path: helpCenterPath,
  },
  {
    StringsEn.title: StringsEn.termsCondition,
    StringsEn.trailing: Icons.arrow_forward_outlined,
    StringsEn.path: termConditionPath,
  },
  {
    StringsEn.title: StringsEn.privacyPolicy,
    StringsEn.trailing: Icons.arrow_forward_outlined,
    StringsEn.path: privacyPath,
  },
];
List<Map<String, dynamic>> accountAccess = [
  {
    StringsEn.title: StringsEn.emailAddress,
    StringsEn.trailing: CacheHelper.getData(key: StringsEn.email),
    StringsEn.path: '',
    StringsEn.extra: '',
  },
  {
    StringsEn.title: StringsEn.phoneNumber,
    StringsEn.trailing: '',
    StringsEn.path: loginSecurityAuthPath,
    StringsEn.extra: StringsEn.phoneNumber,
  },
  {
    StringsEn.title: StringsEn.changePassword,
    StringsEn.trailing: '',
    StringsEn.path: loginSecurityAuthPath,
    StringsEn.extra: StringsEn.emailAddress,
  },
  {
    StringsEn.title: StringsEn.twoStepVerifi,
    StringsEn.trailing: StringsEn.nonActive,
    StringsEn.path: twoStepVerifiPath,
    StringsEn.extra: '',
  },
  {
    StringsEn.title: StringsEn.faceId,
    StringsEn.trailing: '',
    StringsEn.path: '',
    StringsEn.extra: '',
  },
];
const List<String> statusAppliedJobs = [
  'Completed',
  'Rejected',
  'Not Completed',
];
