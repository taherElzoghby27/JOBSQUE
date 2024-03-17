import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/applied/presentation/view_models/applied_job_cubit/applied_job_cubit.dart';
import 'package:jobsque/features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';

import 'widgets/profile_body_smart_refresh.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).getProfile();
    BlocProvider.of<AppliedJobCubit>(context).getAppliedJobs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ProfileBodySmartRefresh(),
      ),
    );
  }
}
