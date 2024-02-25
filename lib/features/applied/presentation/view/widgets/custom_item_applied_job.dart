import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/consts/routesPage.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/helper/custom_snack.dart';
import '../../../../../core/helper/handle_date.dart';
import '../../../../../core/models/apply_user_model/apply_user_model.dart';
import '../../../../../core/models/job_model/job_model.dart';
import '../../../../../core/widgets/logo_title_icon_widget.dart';
import '../../../../../core/widgets/type_jop_component.dart';
import '../../view_models/applied_job_cubit/applied_job_cubit.dart';

import '../../../../../core/widgets/bookmark_widget.dart';
import 'custom_apply_job_process.dart';

class CustomItemAppliedJop extends StatefulWidget {
  const CustomItemAppliedJop({
    super.key,
    required this.job,
    required this.applyUser,
  });

  final Job job;
  final ApplyUser applyUser;

  @override
  State<CustomItemAppliedJop> createState() => _CustomItemAppliedJopState();
}

class _CustomItemAppliedJopState extends State<CustomItemAppliedJop> {
  late int current;

  @override
  void initState() {
    current = BlocProvider.of<AppliedJobCubit>(context).checkStatusAppliedJob(
      applyUser: widget.applyUser,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.verticalPadding10,
      child: AspectRatio(
        aspectRatio: AppConsts.aspect13on9,
        child: InkWell(
          onTap: () => current == 4
              ? showSnack(context, message: StringsEn.appliedCompleted)
              : GoRouter.of(context).push(
                  applyJopPath,
                  extra: {
                    StringsEn.status: StringsEn.notComplete,
                    StringsEn.currentStatus: current,
                    StringsEn.job: widget.job,
                    StringsEn.applyUser: widget.applyUser,
                  },
                ),
          borderRadius: AppConsts.radius15,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //logo jopName bookmark
                LogoTitleIconWidget(
                  logo: widget.job.image!,
                  jopTitle: widget.job.name!,
                  company: widget.job.compName!,
                  country: widget.job.location!,
                  trailing: BookmarkWidget(
                    job: widget.job,
                    color: AppConsts.neutral500,
                  ),
                ),
                //full time -remote -design
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TypeJopComponent(
                        label: StringsEn.fullTime,
                        color: AppConsts.primary500,
                      ),
                    ),
                    Expanded(
                      child: TypeJopComponent(
                        label: StringsEn.remote,
                        color: AppConsts.primary500,
                      ),
                    ),
                    //txt
                    Text(
                      '${handleDate(
                        date: widget.applyUser.updatedAt!,
                      )[0]}\t${handleDate(
                        date: widget.applyUser.updatedAt!,
                      )[1]}',
                      style: AppConsts.style12,
                    ),
                  ],
                ),
                //completed or not
                CustomApplyJobProcess(currentStatus: current),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
