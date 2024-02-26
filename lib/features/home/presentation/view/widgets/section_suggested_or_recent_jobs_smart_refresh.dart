import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/widgets/smart_fresher.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../view_models/home_bloc/home_bloc.dart';
import 'suggested_or_recent_jobs_bloc_builder.dart';

class SectionSuggestedOrRecentJopsSmartRefresh extends StatefulWidget {
  const SectionSuggestedOrRecentJopsSmartRefresh({super.key});

  @override
  State<SectionSuggestedOrRecentJopsSmartRefresh> createState() =>
      _SectionSuggestedOrRecentJopsSmartRefreshState();
}

class _SectionSuggestedOrRecentJopsSmartRefreshState
    extends State<SectionSuggestedOrRecentJopsSmartRefresh> {
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
      child: const SuggestedOrRecentJobBlocBuilder(),
    );
  }
}
