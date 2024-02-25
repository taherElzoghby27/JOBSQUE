import 'package:flutter/material.dart';
import '../../../../../../core/consts/style.dart';
import '../../../../../core/helper/launch_url.dart';

class ItemContactUsWidget extends StatelessWidget {
  const ItemContactUsWidget({
    super.key,
    required this.keyT,
    required this.value,
  });

  final String keyT;
  final String value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUr(context, url: value),
      borderRadius: AppConsts.radius15,
      child: AspectRatio(
        aspectRatio: AppConsts.aspect16on8,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: AppConsts.radius15,
            border: Border.all(color: AppConsts.neutral200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  keyT,
                  style: AppConsts.styleHint14.copyWith(fontSize: 12),
                ),
                FittedBox(
                  child: Text(
                    value,
                    style:
                        AppConsts.style14.copyWith(color: AppConsts.neutral900),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
