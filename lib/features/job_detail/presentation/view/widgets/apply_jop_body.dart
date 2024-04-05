import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/changed_page_cubit/changed_page_cubit.dart';

import 'bloc_consumer_apply_body_apply_job_cubit.dart';

class ApplyJopBody extends StatefulWidget {
  const ApplyJopBody({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<ApplyJopBody> createState() => _ApplyJopBodyState();
}

class _ApplyJopBodyState extends State<ApplyJopBody> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangedPageCubit, ChangedPageState>(
      listener: (context, stateChangedPage) {
        final changedBloc = BlocProvider.of<ChangedPageCubit>(context);
        if (stateChangedPage is ChangedSuccess) {
          currentPage = changedBloc.currentPage;
        } else if (stateChangedPage is ChangedFailure) {
          showSnack(
            context,
            message: stateChangedPage.message,
            background: AppConsts.danger500,
          );
        }
      },
      builder: (context, stateChangedPage) {
        Map<String, dynamic> data = widget.data;
        return BlocConsumerApplyJobCubitBody(
          currentPage: currentPage,
          data: data,
        );
      },
    );
  }
}
