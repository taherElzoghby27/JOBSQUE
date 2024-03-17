import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/features/applied/presentation/view_models/applied_job_cubit/applied_job_cubit.dart';

import 'item_info_job.dart';

class AppliedInfoWidget extends StatefulWidget {
  const AppliedInfoWidget({super.key});

  @override
  State<AppliedInfoWidget> createState() => _AppliedInfoWidgetState();
}

class _AppliedInfoWidgetState extends State<AppliedInfoWidget> {
  int applied = 0;

  @override
  void initState() {
    applied = BlocProvider.of<AppliedJobCubit>(context).appliedJobLength;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ItemInfoJob(
      title: StringsEn.applied,
      subTitle: applied.toString(),
    );
  }
}
