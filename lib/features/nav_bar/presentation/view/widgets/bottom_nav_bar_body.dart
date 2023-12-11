import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';

class bottomNavBarBody extends StatelessWidget {
  const bottomNavBarBody({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: AppConsts.primary500,
      showUnselectedLabels: true,
      selectedLabelStyle: AppConsts.style14.copyWith(
        fontSize: 10,
        color: AppConsts.primary500,
      ),
      unselectedLabelStyle: AppConsts.style14.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
      unselectedItemColor: AppConsts.neutral400,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.houseChimney),
          label: StringsEn.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.message),
          label: StringsEn.messages,
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.briefcase),
          label: StringsEn.applied,
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.bookmark),
          label: StringsEn.saved,
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user),
          label: StringsEn.profile,
        ),
      ],
    );
  }
}
