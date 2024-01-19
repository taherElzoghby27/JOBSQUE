import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/auth/presentation/view/widgets/work_type_component.dart';

import '../../view_model/interested_in_work_cubit/interested_in_work_cubit.dart';

class SectionTypeJob extends StatelessWidget {
  const SectionTypeJob({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InterestedInWorkCubit, InterestedInWorkState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<InterestedInWorkCubit>(context);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: WorkTypeComponent(
                    title: StringsEn.ui,
                    icon: AppAssets.ui,
                    color: bloc.getStatus(key: StringsEn.ui)
                        ? AppConsts.primary500
                        : AppConsts.neutral300,
                    onTap: () => bloc.toggleInterestedInWork(
                      key: StringsEn.ui,
                      status: bloc.getStatus(key: StringsEn.ui) ? false : true,
                    ),
                  ),
                ),
                Expanded(
                  child: WorkTypeComponent(
                    title: StringsEn.ulustratorDesigner,
                    icon: AppAssets.illustrator,
                    color: bloc.getStatus(key: StringsEn.ulustratorDesigner)
                        ? AppConsts.primary500
                        : AppConsts.neutral300,
                    onTap: () => bloc.toggleInterestedInWork(
                      key: StringsEn.ulustratorDesigner,
                      status: bloc.getStatus(key: StringsEn.ulustratorDesigner)
                          ? false
                          : true,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: WorkTypeComponent(
                    title: StringsEn.developer,
                    icon: AppAssets.developer,
                    color: bloc.getStatus(key: StringsEn.developer)
                        ? AppConsts.primary500
                        : AppConsts.neutral300,
                    onTap: () => bloc.toggleInterestedInWork(
                      key: StringsEn.developer,
                      status: bloc.getStatus(key: StringsEn.developer)
                          ? false
                          : true,
                    ),
                  ),
                ),
                Expanded(
                  child: WorkTypeComponent(
                    title: StringsEn.management,
                    icon: AppAssets.management,
                    color: bloc.getStatus(key: StringsEn.management)
                        ? AppConsts.primary500
                        : AppConsts.neutral300,
                    onTap: () => bloc.toggleInterestedInWork(
                      key: StringsEn.management,
                      status: bloc.getStatus(key: StringsEn.management)
                          ? false
                          : true,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: WorkTypeComponent(
                    title: StringsEn.research,
                    icon: AppAssets.research,
                    color: bloc.getStatus(key: StringsEn.research)
                        ? AppConsts.primary500
                        : AppConsts.neutral300,
                    onTap: () => bloc.toggleInterestedInWork(
                      key: StringsEn.research,
                      status: bloc.getStatus(key: StringsEn.research)
                          ? false
                          : true,
                    ),
                  ),
                ),
                Expanded(
                  child: WorkTypeComponent(
                    title: StringsEn.informationTechnology,
                    icon: AppAssets.it,
                    color: bloc.getStatus(key: StringsEn.informationTechnology)
                        ? AppConsts.primary500
                        : AppConsts.neutral300,
                    onTap: () => bloc.toggleInterestedInWork(
                      key: StringsEn.informationTechnology,
                      status:
                          bloc.getStatus(key: StringsEn.informationTechnology)
                              ? false
                              : true,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
