import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/models/job_model.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';
import 'package:jobsque/features/home/presentation/view/widgets/item_recent_jop.dart';

class SectionResult extends StatelessWidget {
  const SectionResult({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: size.height * .04.h,
            child: TileWidget(
              label: "Featuring 120+jops",
            ),
          ),

          ///searching jops
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return FadeAnimation(
                  millSeconds: 250,
                  child: ItemRecentJop(
                    job: Job(),
                    onTapBookMark: () {},
                    onTap: () {},
                  ),
                );
              },
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) => Divider(
                color: AppConsts.neutral200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
