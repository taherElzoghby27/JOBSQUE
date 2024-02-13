import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';
import 'saved_items_listview.dart';

class ItemsSavedWidget extends StatelessWidget {
  const ItemsSavedWidget({
    super.key,
    required this.savedList,
  });

  final List<Job> savedList;

  @override
  Widget build(BuildContext context) {



    return Column(
      children: [
        //(number) Job Saved
        AspectRatio(
          aspectRatio: AppConsts.aspect20on2,
          child: TileWidget(
            label: "${savedList.length}${StringsEn.jobSaved}",
            textAlign: TextAlign.center,
          ),
        ),

        ///jop saved
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SavedItemsListView(savedList: savedList),
          ),
        ),
      ],
    );
  }
}
