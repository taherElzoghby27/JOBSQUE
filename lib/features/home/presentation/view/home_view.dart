import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/features/home/presentation/view/widgets/home_body.dart';
import 'package:jobsque/features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String name = '';
  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).getProfile();
    getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeBody(name: name),
      ),
    );
  }

//get name for user
  getName() async {
    String userName = CacheHelper.getData(key: StringsEn.name);
    name = userName;
  }
}
