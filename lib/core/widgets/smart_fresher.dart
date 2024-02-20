import 'package:flutter/material.dart';
import 'package:jobsque/core/widgets/header_smart_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../consts/strings.dart';

class SmartRefreshWidget extends StatelessWidget {
  const SmartRefreshWidget({
    super.key,
    required this.refreshController,
    this.onRefresh,
    required this.child,
    this.labelLoaded = StringsEn.JobsLoaded,
  });

  final RefreshController refreshController;
  final void Function()? onRefresh;
  final Widget child;
  final String labelLoaded;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      header: HeaderSmartRefresh(
        loadedLabel: labelLoaded,
      ),
      controller: refreshController,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
