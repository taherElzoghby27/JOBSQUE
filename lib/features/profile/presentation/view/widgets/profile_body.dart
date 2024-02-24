import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/widgets/load_json_widget.dart';
import 'package:jobsque/features/auth/data/models/user_login/user.dart';
import 'package:jobsque/features/profile/presentation/view/widgets/section_others.dart';
import 'package:jobsque/features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/models/user_profile_model/user_profile_portolio_model.dart';
import '../../../../../core/widgets/smart_fresher.dart';
import 'section_general.dart';
import 'section_profile_info.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    super.key,
    required this.user,
    required this.ctx,
    required this.isSignOutStateLoading,
  });

  final UserProfilePortfolioModel user;
  final BuildContext ctx;
  final bool isSignOutStateLoading;

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
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
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SmartRefreshWidget(
          refreshController: _refreshController,
          onRefresh: _onRefresh,
          child: ListView(
            children: [
              //section profile
              SectionProfileInfo(
                ctx: widget.ctx,
                name: widget.user.profile!.name!,
                bio: StringsEn.softwareEngineer,
              ),
              //section general
              const SectionGeneral(),
              //section others
              const SectionOthers(),
            ],
          ),
        ),
        Positioned(
          child: widget.isSignOutStateLoading
              ? Center(child: const LoadJsonWidget())
              : Container(),
        ),
      ],
    );
  }
}
