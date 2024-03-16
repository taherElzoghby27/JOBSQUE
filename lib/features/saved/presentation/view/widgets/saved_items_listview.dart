import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/share.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/custom_divider.dart';
import 'package:jobsque/features/saved/presentation/view/widgets/item_saved_jop.dart';

import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/features/saved/presentation/view_models/saved_cubit/saved_cubit.dart';

import '../../../../../core/widgets/custom_button_three_widget.dart';

class SavedItemsListView extends StatefulWidget {
  const SavedItemsListView({super.key, required this.savedList});

  final List<Job> savedList;

  @override
  State<SavedItemsListView> createState() => _SavedItemsListViewState();
}

class _SavedItemsListViewState extends State<SavedItemsListView> {
  late SavedCubit bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<SavedCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///show setting jop
    _showSettingJopSheet(BuildContext context, {required Job job}) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return AspectRatio(
            aspectRatio: AppConsts.aspect13on8,
            child: Container(
              decoration: AppConsts.decorationSheet,
              child: Padding(
                padding: AppConsts.padding10h8v,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(child: SvgPicture.asset(AppAssets.line)),
                    //apply job
                    CustomButtonThreeWidget(
                      leading: Icon(FontAwesomeIcons.briefcase),
                      title: StringsEn.applyJob,
                      trailing: Icons.arrow_forward_ios,
                      onTap: () {
                        GoRouter.of(context).pop();
                        GoRouter.of(context).push(
                          applyJopPath,
                          extra: {
                            StringsEn.status: StringsEn.notOpen,
                            StringsEn.jobId: job.id.toString(),
                          },
                        );
                      },
                    ),
                    //share
                    CustomButtonThreeWidget(
                      leading: Icon(FontAwesomeIcons.share),
                      title: StringsEn.shareVia,
                      trailing: Icons.arrow_forward_ios,
                      onTap: () {
                        GoRouter.of(context).pop();
                        share(text: 'welcome', subject: 'taher');
                      },
                    ),
                    //unsave
                    CustomButtonThreeWidget(
                      leading: Icon(FontAwesomeIcons.bookmark),
                      title: StringsEn.cancelSave,
                      trailing: Icons.arrow_forward_ios,
                      onTap: () {
                        GoRouter.of(context).pop();
                        bloc.deleteJobFromSavedBoxHive(job: job);
                      },
                    ),
                    const AspectRatio(aspectRatio: AppConsts.aspect16on2),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ItemSavedJop(
          job: widget.savedList[index],
          onTapTrailing: () => _showSettingJopSheet(
            context,
            job: widget.savedList[index],
          ),
        );
      },
      itemCount: widget.savedList.length,
      separatorBuilder: (BuildContext context, int index) => CustomDivider(),
    );
  }
}
