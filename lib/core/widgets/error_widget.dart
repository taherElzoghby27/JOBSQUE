import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';

class SomeThingErrorWidget extends StatelessWidget {
  const SomeThingErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            StringsEn.someThingError,
            style: AppConsts.style24,
          ),
        ],
      ),
    );
  }
}
