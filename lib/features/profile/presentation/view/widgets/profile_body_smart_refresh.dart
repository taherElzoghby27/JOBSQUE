import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/smart_fresher.dart';
import 'package:jobsque/features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'profile_body_bloc_builder.dart';

class ProfileBodySmartRefresh extends StatefulWidget {
  const ProfileBodySmartRefresh({super.key});

  @override
  State<ProfileBodySmartRefresh> createState() =>
      _ProfileBodySmartRefreshState();
}

class _ProfileBodySmartRefreshState extends State<ProfileBodySmartRefresh> {
  RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  void _onRefresh() async {
    BlocProvider.of<ProfileCubit>(context).getProfile();
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext contextParent) {
    return SmartRefreshWidget(
      refreshController: _refreshController,
      onRefresh: _onRefresh,
      labelLoaded: StringsEn.profileLoaded,
      child: ProfileBodyBlocConsumer(
        ctx: contextParent,
      ),
    );
  }
}
