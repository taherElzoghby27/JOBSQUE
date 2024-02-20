import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/component_empty.dart';

class CustomCvWidgetLoading extends StatelessWidget {
  const CustomCvWidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.padding10h8v,
      child: AspectRatio(
        aspectRatio: AppConsts.aspect16on3,
        child: Container(
          decoration: AppConsts.decorationRadius8,
          child: Padding(
            padding: AppConsts.allPadding8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //logo pdf
                AspectRatio(
                  aspectRatio: AppConsts.aspect16on14,
                  child: const ComponentEmpty(),
                ),
                const Spacer(flex: 1),
                //pdf info
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AspectRatio(
                        aspectRatio: AppConsts.aspect16on1,
                        child: const ComponentEmpty(),
                      ),
                      AspectRatio(
                        aspectRatio: AppConsts.aspect16on1,
                        child: const ComponentEmpty(),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
