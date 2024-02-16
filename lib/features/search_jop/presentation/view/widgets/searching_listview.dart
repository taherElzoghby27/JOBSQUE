import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_divider.dart';
import 'package:jobsque/core/widgets/fade_animation_widget.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';
import 'package:jobsque/features/home/presentation/view/widgets/item_recent_jop.dart';

import '../../../../../core/models/job_model/job_model.dart';

class SearchingListView extends StatefulWidget {
  const SearchingListView({super.key, required this.jobs});

  final List<Job> jobs;

  @override
  State<SearchingListView> createState() => _SearchingListViewState();
}

class _SearchingListViewState extends State<SearchingListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TileWidget(
          label:
              "${StringsEn.featuring} ${widget.jobs.length} ${StringsEn.jobs}",
        ),

        ///searching jops
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemBuilder: (context, index) {
              return FadeAnimation(
                millSeconds: 250,
                child: ItemRecentJop(
                  job: widget.jobs[index],
                  onTap: () => GoRouter.of(context).push(
                    jopDetailPath,
                    extra: widget.jobs[index],
                  ),
                ),
              );
            },
            itemCount: widget.jobs.length,
            separatorBuilder: (BuildContext context, int index) =>
                const CustomDivider(),
          ),
        ),
      ],
    );
  }
}
