import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/widgets/smart_fresher.dart';
import '../../view_models/home_bloc/home_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';

import 'jobs_list.dart';

class SuggestedOrRecentJobsListView extends StatefulWidget {
  const SuggestedOrRecentJobsListView({super.key, required this.jobs});

  final List<Job> jobs;

  @override
  State<SuggestedOrRecentJobsListView> createState() =>
      _SuggestedOrRecentJobsListViewState();
}

class _SuggestedOrRecentJobsListViewState
    extends State<SuggestedOrRecentJobsListView> {
  RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  void _onRefresh() async {
    BlocProvider.of<HomeBloc>(context).add(GetJobsEvent());
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
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          //(number) jobs
          TileWidget(
            label: "${widget.jobs.length} ${StringsEn.suggestedJob}",
            textAlign: TextAlign.center,
          ),
          JobsList(jobs: widget.jobs),
        ],
      ),
    );
  }
}
