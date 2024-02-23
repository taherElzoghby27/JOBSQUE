import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/applied/presentation/view/widgets/applied_body.dart';
import 'package:jobsque/features/applied/presentation/view_models/applied_job_cubit/applied_job_cubit.dart';

class AppliedView extends StatefulWidget {
  const AppliedView({super.key});

  @override
  State<AppliedView> createState() => _AppliedViewState();
}

class _AppliedViewState extends State<AppliedView> {
  @override
  void initState() {
    BlocProvider.of<AppliedJobCubit>(context).getAppliedJobs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AppliedBody(),
      ),
    );
  }
}
