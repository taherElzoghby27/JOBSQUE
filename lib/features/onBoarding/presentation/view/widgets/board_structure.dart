import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/style.dart';

class BoardStructure extends StatelessWidget {
  const BoardStructure({
    super.key,
    required this.image,
    required this.subTitle,
    required this.titles,
  });

  final String image;
  final List<InlineSpan> titles;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        double maxScreen = constrains.maxHeight;
        return Center(
          child: ListView(
            children: [
              const AspectRatio(aspectRatio: AppConsts.aspect16on3),
              AspectRatio(
                aspectRatio: AppConsts.aspect13on9,
                child: Image.asset(image),
              ),
              const AspectRatio(aspectRatio: AppConsts.aspect16on1),
              Padding(
                padding: const EdgeInsets.all(12),
                child: AspectRatio(
                  aspectRatio: AppConsts.aspect13on9,
                  child: Column(
                    children: [
                      ///title
                      Text.rich(
                        TextSpan(children: titles),
                        style: maxScreen > AppConsts.halfScreenHeight
                            ? AppConsts.style32
                            : AppConsts.style32.copyWith(fontSize: 20),
                      ),

                      ///sub title
                      Text(
                        subTitle,
                        style: maxScreen > AppConsts.halfScreenHeight
                            ? AppConsts.style16
                            : AppConsts.style16.copyWith(fontSize: 14),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
