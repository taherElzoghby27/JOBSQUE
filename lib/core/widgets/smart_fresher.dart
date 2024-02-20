import 'package:flutter/material.dart';
import 'package:jobsque/core/widgets/footer_smart_refresh.dart';
import 'package:jobsque/core/widgets/header_smart_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SmartRefreshWidget extends StatelessWidget {
  const SmartRefreshWidget({
    super.key,
    required this.refreshController,
    this.onRefresh,
    required this.child,
  });

  final RefreshController refreshController;
  final void Function()? onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      header: const HeaderSmartRefresh(),
      footer: const FooterSmartRefresh(),
      controller: refreshController,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
