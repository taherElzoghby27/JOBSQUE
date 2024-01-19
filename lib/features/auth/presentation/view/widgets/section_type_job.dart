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
    bool ui = false;
    bool illDes = false;
    bool it = false;
    bool management = false;
    bool developer = false;
    bool research = false;
    return BlocConsumer<InterestedInWorkCubit, InterestedInWorkState>(
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
                    color: ui ? AppConsts.primary500 : AppConsts.neutral300,
                    onTap: () => bloc.changeUIUx(status: ui),
                  ),
                ),
                Expanded(
                  child: WorkTypeComponent(
                    title: StringsEn.ulustratorDesigner,
                    icon: AppAssets.illustrator,
                    color: illDes ? AppConsts.primary500 : AppConsts.neutral300,
                    onTap: () => bloc.changeIllDes(status: illDes),
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
                    color:
                        developer ? AppConsts.primary500 : AppConsts.neutral300,
                    onTap: () => bloc.changeDeveloper(status: developer),
                  ),
                ),
                Expanded(
                  child: WorkTypeComponent(
                    title: StringsEn.management,
                    icon: AppAssets.management,
                    color: management
                        ? AppConsts.primary500
                        : AppConsts.neutral300,
                    onTap: () => bloc.changeManagement(status: management),
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
                    color:
                        research ? AppConsts.primary500 : AppConsts.neutral300,
                    onTap: () => bloc.changeResearch(status: research),
                  ),
                ),
                Expanded(
                  child: WorkTypeComponent(
                    title: StringsEn.informationTechnology,
                    icon: AppAssets.it,
                    color: it ? AppConsts.primary500 : AppConsts.neutral300,
                    onTap: () => bloc.changeIt(status: it),
                  ),
                ),
              ],
            ),
          ],
        );
      },
      listener: (context, state) {
        if (state is UiUxDesigner) {
          ui = state.status;
        } else if (state is IllustratorDesigner) {
          illDes = state.status;
        } else if (state is Management) {
          management = state.status;
        } else if (state is Developer) {
          developer = state.status;
        } else if (state is ResearchAndAnalytics) {
          research = state.status;
        } else if (state is InformationTechnology) {
          it = state.status;
        }
      },
    );
  }
}
