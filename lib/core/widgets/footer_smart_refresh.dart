
import 'package:flutter/cupertino.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FooterSmartRefresh extends StatelessWidget {
  const FooterSmartRefresh({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus? mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = Text(
            StringsEn.JobsLoaded,
            style: AppConsts.style16.copyWith(
              color: AppConsts.success500,
            ),
          );
        } else if (mode == LoadStatus.loading) {
          body = const CupertinoActivityIndicator();
        } else if (mode == LoadStatus.failed) {
          body = Text(
            StringsEn.loadFailedClickRetry,
            style: AppConsts.style16.copyWith(
              color: AppConsts.danger500,
            ),
          );
        } else if (mode == LoadStatus.canLoading) {
          body = Text(
            StringsEn.releaseToLoadMore,
            style: AppConsts.style16.copyWith(
              color: AppConsts.neutral300,
            ),
          );
        } else {
          body = Text(
            StringsEn.noMoreData,
            style: AppConsts.style16.copyWith(
              color: AppConsts.neutral300,
            ),
          );
        }
        return AspectRatio(
          aspectRatio: AppConsts.aspect16on2,
          child: Center(child: body),
        );
      },
    );
  }
}
