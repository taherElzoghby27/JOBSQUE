
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/custom_type_jop_widget.dart';

import '../../../../../core/consts/strings.dart';
import '../../view_model/search_bloc/search_cubit.dart';

class ComponentJobTypeBlocBuilder extends StatelessWidget {
  const ComponentJobTypeBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        SearchCubit bloc = BlocProvider.of<SearchCubit>(context);
        String fullTime = bloc.jopTimeType;
        if (state is ChangeJopTypeState) {
          fullTime = state.jopType;
        }
        return Wrap(
          runSpacing: 15,
          spacing: 15,
          children: [
            CustomTypeJopWidget(
              label: StringsEn.fullTime,
              labelColor: fullTime == StringsEn.fullTime
                  ? AppConsts.primary500
                  : AppConsts.neutral500,
              onTap: () => bloc.JopTimeTypeEvent(
                jopTimeType: StringsEn.fullTime,
              ),
            ),
            CustomTypeJopWidget(
              label: StringsEn.remote,
              labelColor: AppConsts.neutral500,
              onTap: () {},
            ),
            CustomTypeJopWidget(
              label: StringsEn.contract,
              labelColor: AppConsts.neutral500,
              onTap: () {},
            ),
            CustomTypeJopWidget(
              label: StringsEn.partTime,
              labelColor: fullTime == StringsEn.partTime
                  ? AppConsts.primary500
                  : AppConsts.neutral500,
              onTap: () => bloc.JopTimeTypeEvent(
                jopTimeType: StringsEn.partTime,
              ),
            ),
            CustomTypeJopWidget(
              label: StringsEn.onSite,
              labelColor: AppConsts.neutral500,
              onTap: () {},
            ),
            CustomTypeJopWidget(
              label: StringsEn.internship,
              labelColor: AppConsts.neutral500,
              onTap: () {},
            ),
          ],
        );
      },
    );
  }
}
