import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.height = 0,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: height),
          CircularProgressIndicator(
            color: AppConsts.primary500,
          ),
        ],
      ),
    );
  }
}
