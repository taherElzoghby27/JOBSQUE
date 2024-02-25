import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/widgets/smart_fresher.dart';
import 'package:jobsque/features/home/presentation/view_models/saved_cubit/saved_cubit.dart';
import 'package:jobsque/features/saved/presentation/view/widgets/section_saved_job_bloc_builder.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SectionSavedJobsSmartRefresh extends StatefulWidget {
  const SectionSavedJobsSmartRefresh({super.key});

  @override
  State<SectionSavedJobsSmartRefresh> createState() =>
      _SectionSavedJobsSmartRefreshState();
}

class _SectionSavedJobsSmartRefreshState
    extends State<SectionSavedJobsSmartRefresh> {
  RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  void _onRefresh() async {
    BlocProvider.of<SavedCubit>(context).getSavedJobs();
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
    return SmartRefreshWidget(
      refreshController: _refreshController,
      onRefresh: _onRefresh,
      child: const SectionSavedJobsBlocBuilder(),
    );
  }
}
