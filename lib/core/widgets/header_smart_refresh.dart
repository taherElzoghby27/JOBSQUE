import 'package:flutter/cupertino.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HeaderSmartRefresh extends StatelessWidget {
  const HeaderSmartRefresh({super.key});

  @override
  Widget build(BuildContext context) {
    return WaterDropHeader(
      refresh: const CupertinoActivityIndicator(),
      failed: Text(
        StringsEn.loadFailedClickRetry,
        style: AppConsts.style16.copyWith(
          color: AppConsts.danger500,
        ),
      ),
      complete: Text(
        StringsEn.JobsLoaded,
        style: AppConsts.style16.copyWith(
          color: AppConsts.success500,
        ),
      ),
    );
  }
}
