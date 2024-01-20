import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';

import 'widgets/profile_body.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String name = "Unknown";
  @override
  void initState() {
    getName();
    super.initState();
  }

  //get name from cache Helper
  getName() async {
    name = CacheHelper.getData(key: StringsEn.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ProfileBody(name: name),
      ),
    );
  }
}
