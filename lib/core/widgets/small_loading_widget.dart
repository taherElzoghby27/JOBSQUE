import 'package:flutter/cupertino.dart';
import 'package:jobsque/core/consts/style.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: AppConsts.primary500,
      ),
    );
  }
}
